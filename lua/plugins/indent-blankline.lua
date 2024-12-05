return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
        require("ibl").setup()
    end
}
