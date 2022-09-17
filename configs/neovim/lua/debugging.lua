vim.api.nvim_set_keymap('n', '<F5>',
    [[<Cmd>lua require'dap'.continue()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F10>',
    [[<Cmd>lua require('dap').step_over()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F11>',
    [[<Cmd>lua require('dap').step_intro()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F12>',
    [[<Cmd>lua require('dap').step_out()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>b',
    [[<Cmd>lua require('dap').toggle_breakpoint()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>B',
    [[<Cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>lp',
    [[<Cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>dr',
    [[<Cmd>lua require('dap').repl_open()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>dl',
    [[<Cmd>lua require('dap').run_last()<CR>]],
    { noremap = true, silent = true })
