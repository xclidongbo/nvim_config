-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
keymap("n", "<leader>sx", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume" })

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

-- keymap(
--   "n",
--   "<leader>cc",
--   require("telescope").extensions.flutter.commands,
--   { noremap = true, silent = true, desc = "Flutter Commands" }
-- )
--
-- -- lspsaga
-- -- LSP finder - Find the symbol's definition
-- -- If there is no definition, it will instead be hidden
-- -- When you use an action in finder like "open vsplit",
-- -- you can use <C-t> to jump back
--
-- keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
--
-- -- Code action
-- keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
--
-- -- Rename all occurrences of the hovered word for the entire file
-- keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
--
-- -- Rename all occurrences of the hovered word for the selected files
-- keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
--
-- -- Peek definition
-- -- You can edit the file containing the definition in the floating window
-- -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- -- It also supports tagstack
-- -- Use <C-t> to jump back
-- keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
--
-- -- Go to definition
-- keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
--
-- -- Peek type definition
-- -- You can edit the file containing the type definition in the floating window
-- -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- -- It also supports tagstack
-- -- Use <C-t> to jump back
-- keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
--
-- -- Go to type definition
-- keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
--
-- -- Show line diagnostics
-- -- You can pass argument ++unfocus to
-- -- unfocus the show_line_diagnostics floating window
-- keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
--
-- -- Show buffer diagnostics
-- keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
--
-- -- Show workspace diagnostics
-- keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
--
-- -- Show cursor diagnostics
-- keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
--
-- -- Diagnostic jump
-- -- You can use <C-o> to jump back to your previous location
-- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
--
-- -- Diagnostic jump with filters such as only jumping to an error
-- keymap("n", "[E", function()
--   require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end)
-- keymap("n", "]E", function()
--   require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end)
--
-- -- Toggle outline
-- keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
--
-- -- Hover Doc
-- -- If there is no hover doc,
-- -- there will be a notification stating that
-- -- there is no information available.
-- -- To disable it just use ":Lspsaga hover_doc ++quiet"
-- -- Pressing the key twice will enter the hover window
-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
--
-- -- If you want to keep the hover window in the top right hand corner,
-- -- you can pass the ++keep argument
-- -- Note that if you use hover with ++keep, pressing this key again will
-- -- close the hover window. If you want to jump to the hover window
-- -- you should use the wincmd command "<C-w>w"
-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")
--
-- -- Call hierarchy
-- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
-- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
--
-- -- Floating terminal
-- keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
