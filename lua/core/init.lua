local config = require("core.utils").load_config()
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.fillchars = { eob = " " }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
-- Numbers
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = false
-- disable nvim intro
vim.opt.shortmess:append "sI"
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true

vim.g.mapleader = " "

-- disable some default providers
for _, provider in ipairs { "node", "python3"} do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. ":" .. vim.env.PATH

-- autocmds
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

-- commands
local new_cmd = vim.api.nvim_create_user_command 


