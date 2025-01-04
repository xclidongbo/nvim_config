return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "prettierd")
      return {
        ensure_installed = {
          "stylua",
          "shellcheck",
          "shfmt",
          "flake8",
          "solargraph",
          "jdtls",
        },
      }
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
}
