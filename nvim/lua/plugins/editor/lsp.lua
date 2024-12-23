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
                -- "docker_compose_language_service", -- yamlls should be enough?
                "tailwindcss",                     -- associates with too many filetypes
            },
            preferred_servers = {
                python = { "pyright", "ruff_lsp" },
            },
        },
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
            -- require('tiny-inline-diagnostic').setup()
        end
    }
}
