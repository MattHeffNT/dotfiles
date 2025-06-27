return {
  "folke/which-key.nvim",
  opts = {
    preset = "modern",
    layout = {
      height = { min = 15, max = 30 },
    },
  },
  -- use space again to close which-key
  keys = {
    { "<leader><space>", "<Esc>", desc = "Close WhichKey" },
  },
}
