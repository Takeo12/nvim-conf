return {
  -- LuaSnip: The snippet engine
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = {"~/.config/nvim/snippets"}
      })
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

    end,
  },
  {
    "rafamadriz/friendly-snippets",
    lazy = true,  -- load when needed
  },
}
