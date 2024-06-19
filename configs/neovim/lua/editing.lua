local wk = require("which-key")

-- LSP
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-nvim-dap").setup()
require("mason-null-ls").setup()

wk.register({
    l = {
        name = "LSP",
        f = { "<cmd>Format<cr>", "Format" },
        l = { function() vim.lsp.buf.code_action() end, "All actions" },
        q = { function() vim.lsp.buf.code_action({ only = "quickfix" }) end, "Quickfix" },
        s = { function() vim.lsp.buf.code_action({ only = "source" }) end, "Source" },
        e = { function() vim.lsp.buf.code_action({ only = "refactor" }) end, "Refactor" },
        i = { function() vim.lsp.buf.code_action({ only = "source.organizeImports" }) end, "Organize imports" },
        a = { function() vim.lsp.buf.code_action({ only = "source.fixAll" }) end, "Fix all" },
        r = { function() vim.lsp.buf.rename() end, "Rename" },
        h = { function() vim.lsp.buf.signature_help() end, "Signature" },
        g = {
            name = "Go to",
            d = { function() vim.lsp.buf.definition() end, "Definition" },
            e = { function() vim.lsp.buf.declaration() end, "Declaration" },
            i = { function() vim.lsp.buf.implementation() end, "Implementation" },
            t = { function() vim.lsp.buf.type_definition() end, "Type definition" },
            r = { function() vim.lsp.buf.references() end, "References" },
        }
    },
}, { prefix = "<leader>" })

-- COMPLETION
local default_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(default_capabilities)

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
        }
    end,
}

local lspkind = require('lspkind') -- completion icons

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require 'cmp'
cmp.setup {
    enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
        end
    end,
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
        })
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
    },
}

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

require("cmp_git").setup()


-- Treesitter
require 'nvim-treesitter.configs'.setup {
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
}


-- COMMENTING
require('Comment').setup()


-- DIAGNOSTICS
require('trouble').setup()

wk.register({
    x = {
        name = "Trouble",
        x = { "<cmd>Trouble<cr>", "Show" },
        w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    },
}, { prefix = "<leader>" })


-- null-ls
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.biome,
    },
})

-- conform.vim
require("conform").setup({
  formatters_by_ft = {
    javascript = { 'biome' },
    javascriptreact = { 'biome' },
    typeescript = { 'biome' },
    typeescriptreact = { 'biome' },
  },
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

-- Copilot
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

-- Colorizer
require 'colorizer'.setup()

-- Git
local neogit = require('neogit')
neogit.setup {}

wk.register({
    g = {
        name = "Neogit",
        t = { neogit.open, "Open" },
        c = { function() neogit.open({ "commit" }) end, "Commit" },
        d = { function() neogit.open({ "diff" }) end, "Diff" },
        f = { function() neogit.open({ "fetch" }) end, "Fetch" },
        p = { function() neogit.open({ "pull" }) end, "Pull" },
        u = { function() neogit.open({ "push" }) end, "Push" },
    },
}, { prefix = "<leader>" })

