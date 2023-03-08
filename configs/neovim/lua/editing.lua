-- LSP
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-nvim-dap").setup()
require("mason-null-ls").setup()

-- COMPLETION
local default_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(default_capabilities)

require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
        }
    end
}

local luasnip = require 'luasnip'
require("luasnip.loaders.from_vscode").lazy_load()

local lspkind = require('lspkind')

local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
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
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
    },
}

-- SAGA
require("lspsaga").setup({})
local keymap = vim.keymap.set

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")


-- Treesitter
require'nvim-treesitter.configs'.setup {
    auto_install = true,
}


-- COMMENTING
require('Comment').setup()


-- DIAGNOSTICS
require('trouble').setup()

-- TODO: use keyset from saga section
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })


-- null-ls
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.gomodifytags,
    },
})

