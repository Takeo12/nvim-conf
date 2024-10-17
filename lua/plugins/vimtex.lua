return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	ft = {"tex"},
	config = function()
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk = {
			continuous = 1, -- Enable continuous compilation mode
			options = {
				'-pdf', -- Compile to PDF
				'-interaction=nonstopmode',
				'-synctex=1',
			},
		}
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_view_skim_sync = 1
		vim.g.vimtex_view_skim_activate = 1
		vim.api.nvim_set_keymap('n', '<localleader>ll', ':w<CR>:VimtexCompile<CR>', {noremap = true, silent = true })
	end,
}

