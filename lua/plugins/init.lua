local default_plugins = {
    "nvim-lua/plenary.nvim",

    {
        "nvim-tree/nvim-web-devicons",
        
    },

    -- LSP 
    {
        "neovim/nvim-lspconfig",
        init = function()
            require("core.utils").lazy_load "nvim-lspconfig"
        end,
        config = function()
            require "plugins.lsp"
        end,
    },

    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        opts = function()
            return require "plugins.mason"
        end,
        config = function(_, opts)
            require("mason").setup(opts)

            vim.api.nvim_create_user_command("MasonInstallAll", function()
                vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
            end, {})

            vim.g.mason_binaries_list = opts.ensure_installed
        end,
    },

    {
    	"hrsh7th/nvim-cmp",
    	event = "InsertEnter",
    	dependencies = {
	        {
    	    	-- snippet plugin
	    	    "L3MON4D3/LuaSnip",
	    	    dependencies = "rafamadriz/friendly-snippets",
	    	    opts = { history = true, updateevents = "TextChanged, TextChangedI" },
	    	    config = function(_, opts)
	    	        require("plugins.others").luasnip(opts)
	            end,
	        },
	        -- autopairing of (){}[] etc
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)

                    -- setup cmp for autopairs
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
        opts = function()
	        return require "plugins.cmp"
        end,
	    config = function(_, opts)
	        require("cmp").setup(opts)
	    end,
    },

    {
	"lukas-reineke/indent-blankline.nvim",
	init = function()
	    require("core.utils").lazy_load "indent-blankline.nvim"
	end,
	opts = function()
	    return require("plugins.others").blankline
        end,
	config = function(_, opts)
	    require("core.utils").load_mappings "blankline"
	    require("indent_blankline").setup(opts)
	end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        init = function()
            require("core.utils").lazy_load "nvim-treesitter"
        end,
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function()
            return require "plugins.treesitter"
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", mode = "n", desc = "Comment toggle current line" },
            { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
            { "gc",  mode = "x", desc = "Comment toggle linewise (visual)" },
            { "gbc", mode = "n", desc = "Comment toggle current block" },
            { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
            { "gb",  mode = "x", desc = "Comment toggle blockwise (visual)" },
        },
        init = function()
            require("core.utils").load_mappings "comment"
        end,
        config = function(_, opts)
            require("Comment").setup(opts)
        end,
    },

    -- file managing
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        init = function()
            require("core.utils").load_mappings "nvimtree"
        end,
        opts = function()
            return require "plugins.nvimtree"
        end,
        config = function(_, opts)
            require("nvim-tree").setup(opts)
            vim.g.nvimtree_side = opts.view.side
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        cmd = "Telescope",
        init = function()
            require("core.utils").load_mappings "telescope"
        end,
        opts = function()
            return require "plugins.telescope"
        end,
        config = function(_, opts)
            local telescope = require "telescope"
            telescope.setup(opts)

            -- load extensions
        end,
    },

    {
        "folke/which-key.nvim",
        keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
        init = function ()
            require("core.utils").load_mappings "whichkey"
        end,
        config = function (_, opts)
            require("which-key").setup(opts)
        end,
    },
}

local config = require("core.utils").load_config()

require("lazy").setup(default_plugins, lazy_nvim)
