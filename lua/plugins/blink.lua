return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<Tab>"] = {},   -- disable Tab in blink
      ["<S-Tab>"] = {}, -- disable Shift-Tab in blink
    },
  },
}
