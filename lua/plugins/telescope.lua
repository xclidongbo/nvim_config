local builtin = require("telescope.builtin")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("flutter")
local keymap = vim.keymap
-- require("telescope").load_extension("lazygit")
-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了

keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- 环境里要安装ripgrep
keymap.set("n", "<leader>fb", builtin.buffers, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})
keymap.set("n", "<leader>fo", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
keymap.set("n", "<leader>fc", ":Telescope flutter commands<CR>", {})
