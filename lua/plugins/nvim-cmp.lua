return {
    -- LSP config
    { "neovim/nvim-lspconfig" },

    -- Completion framework
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip"
        }
    },

    -- LSP source for nvim-cmp
    { "hrsh7th/cmp-nvim-lsp" },

    -- Buffer completions
    { "hrsh7th/cmp-buffer" },

    -- Path completions
    { "hrsh7th/cmp-path" },

    -- Command-line completions
    { "hrsh7th/cmp-cmdline" },

    -- Vsnip integration
    -- { "hrsh7th/cmp-vsnip" },
    -- { "hrsh7th/vim-vsnip" },

    -- (Optional) LuaSnip integration
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "saadparawaiz1/cmp_luasnip"
        },
        config = function()
            require("luasnip").setup()
            require('luasnip').filetype_extend("javascript", { "javascriptreact" })
            require('luasnip').filetype_extend("javascript", { "html" })
        end,
    },
    { "saadparwaiz1/cmp_luasnip" },

    -- (Optional) UltiSnips integration
    -- { "SirVer/ultisnips" },
    -- { "quangnguyen30192/cmp-nvim-ultisnips" },
}
