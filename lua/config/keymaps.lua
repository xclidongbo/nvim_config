-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local keymap = vim.keymap.set
-- keymap("n", "<leader>sx", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume" })

-- json
-- zc - Close (fold) the current fold under the cursor.
-- zo - Open (unfold) the current fold under the cursor.
-- za - Toggle between closing and opening the fold under the cursor.
-- zR - Open all folds in the current buffer.
-- zM - Close all folds in the current buffer.
-- neogen
vim.api.nvim_set_keymap(
  "n",
  "<leader>nf",
  ":lua require('neogen').generate()<CR>",
  { noremap = true, silent = true, desc = "注释func & class & type & file" }
)

-- text case
vim.api.nvim_set_keymap("n", "gaa", "<cmd>TextCaseOpenTelescopeQuickChange<CR>", { desc = "Telescope Quick Change" })
vim.api.nvim_set_keymap("n", "gai", "<cmd>TextCaseOpenTelescopeLSPChange<CR>", { desc = "Telescope LSP Change" })

vim.api.nvim_set_keymap(
  "n",
  "gac",
  ":lua require('textcase').lsp_rename('to_camel_case')<CR>",
  { desc = "To camel case" }
)

vim.api.nvim_set_keymap(
  "n",
  "gas",
  ":lua require('textcase').lsp_rename('to_snake_case')<CR>",
  { desc = "To snake case" }
)

vim.api.nvim_set_keymap(
  "n",
  "gau",
  ":lua require('textcase').lsp_rename('to_upper_case')<CR>",
  { desc = "To upper case" }
)
vim.api.nvim_set_keymap(
  "n",
  "gal",
  ":lua require('textcase').lsp_rename('to_lower_case')<CR>",
  { desc = "To lower case" }
)
