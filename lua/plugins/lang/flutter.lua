return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    keys = {
      {
        "<leader>cc",
        function()
          require("telescope").extensions.flutter.commands()
        end,
        desc = "Flutter Commands",
      },
    },
    config = true,
    -- config = function()
    --   require("flutter-tools").setup({
    --     ui = {
    --       border = "rounded",
    --     },
    --   })
    --   require("telescope").load_extension("flutter")
    -- end,
  },
}
