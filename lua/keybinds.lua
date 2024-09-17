-- Toggle nvim-tree
vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true })

-- Focus on the window to the left
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
-- Focus on the window below
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
-- Focus on the window above
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
-- Focus on the window to the right
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

-- Next tab
vim.api.nvim_set_keymap("n", "gt", ":BufferNext<CR>", { noremap = true })

-- Previous tab
vim.api.nvim_set_keymap("n", "gT", ":BufferPrevious<CR>", { noremap = true })

-- Show diagnostics for the current line
vim.api.nvim_set_keymap('n', '<Leader>ld', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- Trigger code actions (quick fixes)
vim.api.nvim_set_keymap('n', '<Leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<Leader>la', '<cmd>lua vim.lsp.buf.range_code_action()<CR>',
    { noremap = true, silent = true })

-- Move lines up
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
-- Move lines down
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
-- Move selected lines in visual mode
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Telescope projects
vim.keymap.set('n', '<leader>tsp', ':Telescope projects<CR>', { noremap = true })

-- Todo Quickfix
vim.keymap.set('n', '<leader>tq', ':TodoQuickFix<CR>', { noremap = true })

-- Todo Telescope
vim.keymap.set('n', '<leader>tt', ':TodoTelescope<CR>', { noremap = true })

-- Telescope undo
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

-- Clipboard paste
vim.keymap.set("n", "<leader>p", "\"+p", { noremap = true })

-- Clipboard yank line
vim.keymap.set("n", "<leader>cy", "\"+yy", { noremap = true })
vim.keymap.set("v", "<leader>cy", "\"+y", { noremap = true })
