vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.cmd("inoremap jk <Esc>")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup("plugins")

--require("catppuccin").setup()
--vim.cmd.colorscheme "catppuccin-mocha"

-- local builtin = require("telescope.builtin")

