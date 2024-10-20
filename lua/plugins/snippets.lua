return {
    -- LuaSnip: The snippet engine
    {
        "L3MON4D3/LuaSnip",
        config = function()
            -- Load snippets from vim-snippets
            require("luasnip.loaders.from_vscode").lazy_load({
		    paths = {"~/.confg/nvim/snippets"}
	    })
        end,
    },

    -- vim-snippets: Collection of snippets
    {
        "honza/vim-snippets",
        lazy = true,  -- load when needed
    },

    -- Optional: friendly-snippets for additional snippets
    {
        "rafamadriz/friendly-snippets",
        lazy = true,  -- load when needed
    },
}
