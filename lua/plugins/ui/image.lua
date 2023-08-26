return {
  -- { "m00qek/baleia.nvim", tag = "v1.3.0" },
  {
    "samodostal/image.nvim",
    config = function()
      require("image").setup({
        render = {
          min_padding = 5,
          show_label = true,
          use_dither = true,
          foreground_color = false,
          background_color = false,
        },
        events = {
          update_on_nvim_resize = true,
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
  },
}
