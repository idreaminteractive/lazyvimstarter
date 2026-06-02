local function mise_bin(base)
  local candidates = { base }
  if vim.fn.has("mac") == 1 then
    if vim.fn.system({ "uname", "-m" }):match("arm64") then
      candidates[#candidates + 1] = base .. "-aarch64-apple-darwin"
    else
      candidates[#candidates + 1] = base .. "-x86_64-apple-darwin"
    end
  else
    candidates[#candidates + 1] = base .. "-x86_64-unknown-linux-gnu"
    candidates[#candidates + 1] = base .. "-aarch64-unknown-linux-gnu"
  end
  for _, name in ipairs(candidates) do
    local path = vim.fn.exepath(name)
    if path ~= "" then
      return path
    end
  end
  return base
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "odin" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ols = {
          mason = false,
          cmd = { mise_bin("ols") },
          init_options = {
            checker_args = "-strict-style",
            collections = {
              { name = "shared", path = vim.fn.expand("$HOME/odin-lib") },
            },
          },
          settings = {
            odin_command = mise_bin("odin"),
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        odinfmt = {
          command = mise_bin("odinfmt"),
          args = { "-stdin" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        odin = { "odinfmt" },
      },
    },
  },
}
