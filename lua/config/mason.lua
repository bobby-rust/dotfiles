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
        if server == "ts_ls" then
            -- Custom config to limit tsserver to TypeScript files only
            lspconfig.tsserver.setup({
                filetypes = { "typescript", "typescriptreact", "typescript.tsx" }, -- Only for TS files
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    setup_lsp_keymaps(client, bufnr)
                end,
            })
            -- Custom config for cssls
        elseif server == "cssls" then
            lspconfig.cssls.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    -- Keymaps and other on_attach logic
                    setup_lsp_keymaps(client, bufnr) -- Using a helper function for keymaps
                end,
                settings = {
                    css = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                    scss = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                    less = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                },
            })
        else
            -- Default setup for all other servers
            lspconfig[server].setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    setup_lsp_keymaps(client, bufnr)
                end,
            })
        end
    end
})

-- Function to set up LSP keymaps
function setup_lsp_keymaps(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>f',
            '<cmd>lua vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })<CR>',
            { noremap = true, silent = true })
    end

    if client.server_capabilities.codeActionProvider then
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>',
            { noremap = true, silent = true })
    end

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
        { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
        { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>',
        { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
        { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
        { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
        { noremap = true, silent = true })
end

-- Lua LSP configuration
lspconfig.lua_ls.setup {
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("LuaFormat", { clear = true }),
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
