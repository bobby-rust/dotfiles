return {
    {
        "Mofiqul/vscode.nvim",
        config = function()
            vim.cmd.colorscheme("vscode")
        end
    },
    {
        "rockyzhang24/arctic.nvim",
        branch = "v2",
        dependencies = { "rktjmp/lush.nvim" }
    }
}
