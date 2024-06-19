local wk = require("which-key")

-- LEAP
require('leap').set_default_keymaps()

-- TELESCOPE
local telescope = require('telescope')
telescope.setup()
telescope.load_extension('fzf')

local telescope_builtin = require('telescope.builtin')

wk.register({
    f = {
        name = "Find",
        f = { function() telescope_builtin.find_files() end, "Files" },
        g = { function() telescope_builtin.live_grep() end, "Grep" },
        b = { function() telescope_builtin.buffers() end, "Buffers" },
        h = { function() telescope_builtin.help_tags() end, "Help" },
        c = { function() telescope_builtin.current_buffer_fuzzy_find() end, "Current buffer" },
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
        a = { function() harpoon:list():add() end, "Add current file" },
        t = { function() toggle_telescope(harpoon:list()) end, "Show list" },
        ["1"] = { function() harpoon:list():select(1) end, "Item 1" },
        ["2"] = { function() harpoon:list():select(2) end, "Item 2" },
        ["3"] = { function() harpoon:list():select(3) end, "Item 3" },
        ["4"] = { function() harpoon:list():select(4) end, "Item 4" },
        ["5"] = { function() harpoon:list():select(5) end, "Item 5" },
    }
}, { prefix = "<leader>" })
