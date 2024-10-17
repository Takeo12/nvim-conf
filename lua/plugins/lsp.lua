return {
    -- Plugin for managing LSP servers (optional but highly recommended)
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup() -- Setup Mason
        end,
    },

    -- Install nvim-lspconfig to configure LSP servers
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = { "williamboman/mason-lspconfig.nvim" }, -- Bridge between mason and lspconfig
        config = function()
            -- Ensure the Mason-lspconfig bridge is set up
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "tsserver", "lua_ls" }, -- Add LSP servers you need
            })

            -- Setup Python (pyright) as an example
            require("lspconfig").pyright.setup{}

            -- Setup other servers similarly
            -- require("lspconfig").tsserver.setup{} -- JavaScript/TypeScript
        end,
    },

    -- Autocompletion plugin (nvim-cmp) and dependencies
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",       -- Buffer source for nvim-cmp
            "saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
            "L3MON4D3/LuaSnip",         -- Snippet engine
        },
        config = function()
            -- Setup nvim-cmp and luasnip for autocompletion
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- LuaSnip snippet expansion
                    end,
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept completion
                },
                sources = {
                    { name = 'nvim_lsp' }, -- Completion from LSP
                    { name = 'luasnip' },  -- Completion from snippets
                    { name = 'buffer' },   -- Completion from buffer
                },
            })
        end,
    },

    -- Optionally add friendly-snippets for a large collection of snippets
    {
        "rafamadriz/friendly-snippets",
        lazy = false,
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}

