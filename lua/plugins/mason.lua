return {
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed
    -- are installed, mason-lspconfig will not automatically install debug adapters for us
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            -- ensure the java debug adapter is installed
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
    }
}
