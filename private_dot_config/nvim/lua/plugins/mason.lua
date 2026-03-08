-- the plugin to manage lsp and formaters etc
return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Add your language servers here
        ensure_installed = { "pyright", "clangd" }, -- etc.
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").pyright.setup({}) -- Example LSP server setup for Python
      -- Add more LSP servers as needed
    end,
  },
}
