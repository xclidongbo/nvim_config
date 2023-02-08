require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
    ensure_installed = { "sumneko_lua" },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").sumneko_lua.setup {
  capabilities = capabilities,
}
require("lspconfig").tsserver.setup{
  capabilities = capabilities,
}

