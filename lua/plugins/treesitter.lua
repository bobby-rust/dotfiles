return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require "nvim-treesitter.configs".setup {
            ensure_installed = {
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "c",
                "cpp",
                "cmake",
                "dot",
                "gitcommit",
                "gitignore",
                "go",
                "gomod",
                "java",
                "jsdoc",
                "json",
                "lua",
                "make",
                "markdown",
                "python",
                "regex",
                "rust",
                "sql"
            },
            highlight = { enable = true },
            indent = { enable = true },
            fold = { enable = true },
            playground = {
                enable = true
            },
        }
    end
}
