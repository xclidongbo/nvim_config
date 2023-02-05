local builtin = require('telescope.builtin')
local keymap = vim.keymap
-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了

keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})  -- 环境里要安装ripgrep
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
