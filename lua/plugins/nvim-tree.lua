vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	-- 隐藏 .文件 和 node_modules 文件夹
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
		-- custom = { ".git", "node_modules", ".cache", ".DS_Store" },
		-- custom = { ".git", ".cache", ".DS_Store" },
		custom = {},
	},
})
