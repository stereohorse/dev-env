require('leap').set_default_keymaps()

require('telescope').setup()
require('telescope').load_extension('fzf')

local api = vim.api

api.nvim_set_keymap('n', '<Leader>ff',  [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Leader>fg',  [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Leader>fb',  [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Leader>fh',  [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Leader>fc',  [[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })

require("symbols-outline").setup()

-- Folding
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

vim.keymap.set('n', 'zK', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end)

require('ufo').setup()
