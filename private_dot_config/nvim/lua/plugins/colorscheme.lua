return {
  -- Configure the colorscheme plugin
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
    },
  },

  -- Tell LazyVim to use that colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
