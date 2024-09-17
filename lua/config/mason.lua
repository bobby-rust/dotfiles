require("mason").setup()

require("mason-null-ls").setup({
    handlers = {},
})

require("mason-lspconfig").setup({
    automatic_installation = true
})

local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup_handlers({
    function(server)
        lspconfig[server].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                -- Check if the LSP server supports document formatting
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>f',
                        '<cmd>lua vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })<CR>',
                        { noremap = true, silent = true })
                end

                -- Check if the LSP server supports code actions
                if client.server_capabilities.codeActionProvider then
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                        { noremap = true, silent = true })
                end

                -- Keymap for "Go to Definition"
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
                    { noremap = true, silent = true })

                -- Keymap for "Go to Implementation"
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
                    { noremap = true, silent = true })

                -- Keymap for "Hover Documentation"
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>',
                    { noremap = true, silent = true })

                -- Keymap for Find References
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
                    { noremap = true, silent = true })
                -- Keymap for "Go to declaration"
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
                    { noremap = true, silent = true })
                -- Keymap for "Rename"
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
                    { noremap = true, silent = true })
            end
        })
    end
})

lspconfig.lua_ls.setup {
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = group,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, async = false })
                end,
            })
        end
    end,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
}
