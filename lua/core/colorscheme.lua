-- -- tokyonight
-- --
-- local themeName = "tokyonight"
-- local status, theme = pcall(require, themeName)
-- if not status then
--   print(themeName .. "主题没找到")
-- return
-- end
--
-- -- " There are also colorschemes for the different styles
-- -- colorscheme tokyonight-night
-- -- colorscheme tokyonight-storm
-- -- colorscheme tokyonight-day
-- -- colorscheme tokyonight-moon
-- vim.cmd("colorscheme tokyonight-moon")

-- gruvbox
--
local themeName = "gruvbox"
local status, theme = pcall(require, themeName)
if not status then
	print(themeName .. "主题没找到")
	return
end

-- vim.o.background = "dark" -- dark or "light"
vim.cmd("colorscheme gruvbox")
