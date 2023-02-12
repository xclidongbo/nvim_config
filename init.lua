
require("plugins.plugins-setup")

-- core
require("core.options")
require("core.keymaps")
require("core.colorscheme")

-- lsp
require("plugins.lsp.lspconfig")
require("plugins.lsp.mason")
require("plugins.lsp.null-ls")
require("plugins.lsp.trouble")

-- other
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.cmp")
require("plugins.autopairs")
require("plugins.comment")
require("plugins.bufferline")
require("plugins.gitsigns")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.dashboard")
require("plugins.colorizer")

