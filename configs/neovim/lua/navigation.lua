local wk = require("which-key")

-- LEAP
require('leap').set_default_keymaps()

-- TELESCOPE
local telescope = require('telescope')
telescope.setup()
telescope.load_extension('fzf')
telescope.load_extension('projects')
telescope.load_extension("smart_open")

local telescope_builtin = require('telescope.builtin')

wk.register({
    f = {
        name = "Find",
        f = { telescope_builtin.find_files, "Files" },
        g = { telescope_builtin.live_grep, "Grep" },
        b = { telescope_builtin.buffers, "Buffers" },
        h = { telescope_builtin.help_tags, "Help" },
        r = { telescope_builtin.lsp_references, "References" },
        i = { telescope_builtin.lsp_implementations, "Implementations" },
        t = { telescope_builtin.treesitter, "Treesitter" },
        s = { telescope.extensions.smart_open.smart_open, "Smart open" },
        c = { telescope_builtin.current_buffer_fuzzy_find, "Current buffer" },
    }
}, { prefix = "<leader>" })

-- SYMBOLS OUTLINE
local symbols = require("symbols-outline")
symbols.setup({
    highlight_hovered_item = false,
    autofold_depth = 1,
})

wk.register({
    o = { function() symbols.toggle_outline() end, "Toggle outline" },
}, { prefix = "<leader>" })

-- UFO
local ufo = require('ufo')
ufo.setup()

local function peekFold()
    local winid = ufo.peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end

wk.register({
    z = {
        name = "UFO",
        r = { ufo.openFold, "Open fold" },
        c = { ufo.closeFold, "Close fold" },
        R = { ufo.openAllFolds, "Open all folds" },
        M = { ufo.closeAllFolds, "Close all folds" },
        K = { peekFold, "Peek folded lines" },
    }
})

-- HARPOON
local harpoon = require("harpoon")
harpoon:setup()

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

wk.register({
    h = {
        name = "Harpoon",
        a = { function() harpoon:list():add() end, "Append current file" },
        p = { function() harpoon:list():add() end, "Prepend current file" },
        t = { function() toggle_telescope(harpoon:list()) end, "Show list" },

        ["1"] = { function() harpoon:list():select(1) end, "Item 1" },
        ["2"] = { function() harpoon:list():select(2) end, "Item 2" },
        ["3"] = { function() harpoon:list():select(3) end, "Item 3" },
        ["4"] = { function() harpoon:list():select(4) end, "Item 4" },
        ["5"] = { function() harpoon:list():select(5) end, "Item 5" },
        r = {
            name = "Replace",
            ["1"] = { function() harpoon:list():replace_at(1) end, "Replace item 1" },
            ["2"] = { function() harpoon:list():replace_at(2) end, "Replace item 2" },
            ["3"] = { function() harpoon:list():replace_at(3) end, "Replace item 3" },
            ["4"] = { function() harpoon:list():replace_at(4) end, "Replace item 4" },
            ["5"] = { function() harpoon:list():replace_at(5) end, "Replace item 5" },
        },
        c = {
            name = "Remove",
            c = { function() harpoon:list():clear() end, "Clear entire list" },
            ["1"] = { function() harpoon:list():remove_at(1) end, "Remove item 1" },
            ["2"] = { function() harpoon:list():remove_at(2) end, "Remove item 2" },
            ["3"] = { function() harpoon:list():remove_at(3) end, "Remove item 3" },
            ["4"] = { function() harpoon:list():remove_at(4) end, "Remove item 4" },
            ["5"] = { function() harpoon:list():remove_at(5) end, "Remove item 5" },
        }
    }
}, { prefix = "<leader>" })

-- PROJECTS
local project = require("project_nvim")
project.setup()

wk.register({
    p = {
        name = "Projects",
        t = { telescope.extensions.projects.projects, "List" },
    }
}, { prefix = "<leader>" })

