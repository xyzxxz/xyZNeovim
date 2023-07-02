local M = {}

M.ui = {
    -- cmp
    cmp = {
        icons = true,
        lspkind_text = true,
        style = "default",
        border_color = "grey_fg",
        selected_item_bg = "colored",
    },

    telescope = {
        style = "borderless",
    },

    tabufline = {
        show_numbers = false,
        enabled = true,
        lazyload = true,
        overriden_modules = nil,
    },

    -- dashboard
    xyzdash = {
        load_on_startup = false,
        header = {
            "  ##                ## ",
            "   ##             ###  ",
            "    ##         ###     ",
            "     ##      ###       ",
            "      ######           ",
            "     #####             ",
            "   ###   ###           ",
            " ##        ##          ",
            "###          ###       ",
        },

        buttons = {
        { "Find File",    "Spc f f", "Telescope find_files" },
        { "Recent Fiels", "Spc f r", "Telescope oldfiles" },
        { "Themes",       "Spc t h", "Telescope themes" },
        },
    },

    cheatsheet = { theme = "grid" },

    lsp = {
        signature = {
            disabled = false,
            silent = true,
        },
    },
}

M.plugins = ""

M.lazy_nvim = require "plugins.lazy_nvim"

M.mappings = require "core.mappings"

return M

