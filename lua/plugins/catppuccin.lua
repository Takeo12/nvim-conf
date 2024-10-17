return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			integrations = {
				nvimtree = true,
				telescope = true,
				-- Add other integrations you want here
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}

