-- 自动安装packer

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile 改成了 PackerSync
-- plugins.lua 改成了plugins-setup.lua,适应本地文件名称
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- 主题
	use("folke/tokyonight.nvim")
	use({ "ellisonleao/gruvbox.nvim" })

	-- icons
	use("nvim-tree/nvim-web-devicons")

	-- 状态栏
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- 文档树
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	use("christoomey/vim-tmux-navigator") -- 用ctl-hjkl来定位窗口
	-- 语法高亮
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow") -- 配合treesitter，不同括号颜色区分
	-- lsp
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	-- neovim-tutorial/lspconfig.lua at main · bryant-video/neovim-tutorial
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	}) -- enhanced lsp uis
	-- 自动补全
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path") -- 文件路径
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")

	use("L3MON4D3/LuaSnip") -- snippets引擎，不装这个自动补全会出问题
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use({
		"dsznajder/vscode-es7-javascript-react-snippets",
		run = "yarn install --frozen-lockfile && yarn compile",
	})

	-- for vsnip users
	use("hrsh7th/cmp-vsnip")
	-- use "hrsh7th/vim-vsnip"

	use("numToStr/Comment.nvim") -- gcc和gc注释
	use("windwp/nvim-autopairs") -- 自动补全括号
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	use("JoosepAlviste/nvim-ts-context-commentstring") -- ts注释

	-- use "akinsho/bufferline.nvim" -- buffer分割线
	-- using packer.nvim
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	use("lewis6991/gitsigns.nvim") -- 左则git提示

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1", -- 文件检索
		requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
	})
	-- 终端
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- dashboard-nvim
	use({
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{ desc = " Update", group = "@property", action = "PackerSync", key = "u" },
						{
							desc = " Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = " Apps",
							group = "DiagnosticHint",
							action = "Telescope app",
							key = "a",
						},
						{
							desc = " dotfiles",
							group = "Number",
							action = "Telescope dotfiles",
							key = "d",
						},
					},
				},
			})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- auto close tag

	-- colorizer
	use("NvChad/nvim-colorizer.lua")
	-- blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")

	-- markdown preview-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- trouble
	use({ "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" })

	-- surround
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- leap 跳转
	use({ "ggandor/leap.nvim" })

	-- go
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua") -- recommended if need floating window support

	if packer_bootstrap then
		require("packer").sync()
	end
end)
