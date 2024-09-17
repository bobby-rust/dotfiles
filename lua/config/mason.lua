require("mason").setup()

require("mason-lspconfig").setup({
    automatic_installation = true
})

local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup_handlers({
    function (server)
        lspconfig[server].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                -- Check if the LSP server supports document formatting
                if client.server_capabilities.documentFormattingProvider then

                    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>f', '<cmd>lua vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })<CR>', { noremap = true, silent = true })
                end

                -- Check if the LSP server supports code actions
                if client.server_capabilities.codeActionProvider then
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
                end
            end
        })
    end
})

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT', -- or Lua 5.1, 5.2, 5.3, 5.4
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
}
