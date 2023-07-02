local M = {}

M.echo = function(str)
    vim.cmd "redraw"
    vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.lazy = function(install_path)
    M.echo "Installing lazy.nvim & plugins ..."
    local repo = "git@github.com:folke/lazy.nvim.git"
    vim.fn.system({ "git", 
    		    "clone", 
		    "--filter=blob:none", 
		    repo, 
		    "--branch=stable", 
		    install_path,
    })
    vim.opt.rtp:prepend(install_path)

    require "plugins"
end

return M
