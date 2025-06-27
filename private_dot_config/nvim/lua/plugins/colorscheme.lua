return {
  -- Configure the colorscheme plugin
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
    },
  },

  -- choose colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
