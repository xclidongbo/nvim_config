local status, neogen = pcall(require, "neogen")

if not status then
	return
end
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>nf", ":lua require('neogen').generate()<CR>", opts)
