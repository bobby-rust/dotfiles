require("config.lazy")
require("config.mason")
require("config.null-ls")
require("config.nvim-cmp")
require("config.lualine")
require("config.nvim-tree")
require("config.project")
require("keybinds")

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Transparency
vim.cmd("hi normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NvimTreeNormal guibg=NONE ctermbg=NONE")

-- Code Folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = true
vim.opt.foldlevel = 99

-- Formatting
vim.g.format_on_save = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.wrap = false
vim.o.relativenumber = true

print("~/.config/nvim/init.lua loaded")
