return {
    -- Install LuaSnip (snippet engine)
    { 
        "L3MON4D3/LuaSnip",
        lazy = false,   -- Load on startup
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()  -- Load friendly-snippets
        end,
    },

    -- Install nvim-cmp (completion plugin)
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
            "saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
            "L3MON4D3/LuaSnip",         -- Snippet engine
        },
        config = function()
            local cmp = require'cmp'
            local luasnip = require'luasnip'

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = {
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept completion
                    ['<C-Space>'] = cmp.mapping.complete(),            -- Trigger completion
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- Snippet source
                    { name = 'buffer' },  -- Buffer completion
                },
            })
        end,
    },

    -- Optionally, add a snippet collection like 'friendly-snippets'
    {
        "rafamadriz/friendly-snippets",
        lazy = false,
    },

}

