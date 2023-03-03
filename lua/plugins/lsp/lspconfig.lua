local keymap = vim.keymap -- for conciseness
-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
	keymap.set("n", "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", opts) -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
		workspace = {
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.stdpath("config") .. "/lua"] = true,
			},
		},
	},
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig").tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

require("lspconfig").cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig").html.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- go配置
require("lspconfig").gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- emmet_ls 配置
require("lspconfig").emmet_ls.setup({})
-- local configs = require("lspconfig/configs")
-- local capabilities1 = vim.lsp.protocol.make_client_capabilities()
-- capabilities1.textDocument.completion.completionItem.snippetSupport = true
--
-- require("lspconfig").emmet_ls.setup({
-- 	capabilities = capabilities1,
-- 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
-- 	init_options = {
-- 		html = {
-- 			options = {
-- 				["bem.enabled"] = true,
-- 			},
-- 		},
-- 	},
-- })

-- ruby
require("lspconfig").solargraph.setup({})
-- sourcekit
require("lspconfig").sourcekit.setup({})
-- bash lsp
require("lspconfig").bashls.setup({})
-- jsonls
local capabilities1 = vim.lsp.protocol.make_client_capabilities()
capabilities1.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").jsonls.setup({
	capabilities = capabilities1,
})
