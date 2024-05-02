-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- use({
    --     "catppuccin/nvim",
    --     as = "catppuccin",
    --     colorscheme = "catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha",
    --     config = function()
    --  	       vim.cmd.colorscheme "catppuccin-mocha"
    --         require("catppuccin").setup {
    --            color_overrides = {
    --                 all = {
    --                    strings = "#ffffff",
    --                 },
    --             }
    --         }
    --     end
    -- }):
    use { "rose-pine/neovim", as = "rose-pine" }
    use { 'shaunsingh/nord.nvim', as = "nord", }
    use { 'yashguptaz/calvera-dark.nvim' }
    use { "EdenEast/nightfox.nvim" }
    use("oxfist/night-owl.nvim")

    use({
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end
    })


    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { "neovim/nvim-lspconfig" },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use('github/copilot.vim')
    use('ThePrimeagen/vim-be-good')
    use({
        "stevearc/conform.nvim",

        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    json = { "prettier" },
                    css = { "prettier" },
                    scss = { "prettier" },
                    html = { "prettier" },
                    markdown = { "prettier" },
                    lua = { "stylua" },
                    yaml = { "prettier" },
                    python = { "isort", "black" },
                },
                format_on_save = {
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                }
            })

            vim.keymap.set({ "n", "v" }, "<leader>mp", function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                })
            end, { desc = "Format file or range (in visual mode)" })
        end,
    })
    use { "akinsho/toggleterm.nvim" }
    use { 'numToStr/Comment.nvim' }
end)
