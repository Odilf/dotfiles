return {
    -- Lazydev config from `https://github.com/folke/lazydev.nvim`
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },

    -- TODO: Revise how this works
    {
        "dundalek/lazy-lsp.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
        },
        opts = {
            excluded_servers = {
                "ccls",          -- prefer clangd
                "flow",          -- prefer eslint and tsserver
                "ltex",          -- grammar tool using too much CPU
                "quick_lint_js", -- prefer eslint and tsserver
                "rnix",          -- archived on Jan 25, 2024
                "scry",          -- archived on Jun 1, 2023
                "als",           -- deprecated, it seems
                -- "denols",                          -- prefer eslint and tsserver
                -- "docker_compose_language_service", -- yamlls should be enough?
                -- "tailwindcss",                     -- associates with too many filetypes
            },
            preferred_servers = {
                markdown = {},
                python = { "pyright", "ruff_lsp" },
                javascript = { "eslint", "tsserver " },
                typescript = { "eslint", "tsserver " },
            },
        },
        config = function(_, opts)
            local lsp_zero = require("lsp-zero")

            lsp_zero.extend_lspconfig({
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                float_border = 'rounded',
                sign_text = true,
            })

            require("lazy-lsp").setup(opts)
        end,
    },

    -- top status bar
    {
        'glepnir/lspsaga.nvim',
        event = 'LspAttach',
        dependencies = {
            { 'nvim-tree/nvim-web-devicons' },
            { 'nvim-treesitter/nvim-treesitter' }
        }
    },

    -- inline fancy diagnostics
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        config = function()
            vim.opt.updatetime = 100
            vim.diagnostic.config({ virtual_text = false })
            require('tiny-inline-diagnostic').setup()
        end
    }
}
