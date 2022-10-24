-- LSP
require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "sumneko_lua",
        "pyright",
        "tsserver",
        "clangd",
        "cmake",
    },
    automatic_installation = { exclude = { "jdtls" } },
})


-- COMPLETION
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,
    ["sumneko_lua"] = function()
        require('lspconfig').sumneko_lua.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,
}

require 'lspconfig'.racket_langserver.setup {}

local luasnip = require 'luasnip'
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
        { name = 'path' }
    },
}

-- SAGA
local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga()

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })

-- COMMENTING
require('Comment').setup()

-- DIAGNOSTICS
require('trouble').setup()

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
    { silent = true, noremap = true }
)

-- FORMATTING
require("formatter").setup {
    filetype = {
        typescript = {
            function()
                return {
                    exe = "prettierd",
                    args = { vim.api.nvim_buf_get_name(0) },
                    stdin = true,
                }
            end
        },
        javascript = {
            function()
                return {
                    exe = "prettierd",
                    args = { vim.api.nvim_buf_get_name(0) },
                    stdin = true,
                }
            end
        },
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_spaces
        }
    }
}

vim.api.nvim_set_keymap('n', '<Leader>f', ':Format<CR>', { noremap = true, silent = true })
