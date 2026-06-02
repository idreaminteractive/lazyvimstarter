return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "templ" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        templ = {
          settings = {
            templ = {
              enable_snippets = true,
            },
          },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "templ" } },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        templ = { "templ" },
      },
    },
  },
}
