return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- 1. Ensure the problematic parsers are explicitly requested
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "vim", "vimdoc", "query", "regex" })
      end

      -- 2. Force building from source via Git
      -- This bypasses the mismatched binaries that cause the "substitute" error
      opts.install_info = {
        prefer_git = true,
      }

      -- 3. Keep your existing indent preferences
      opts.indent = vim.tbl_deep_extend("force", opts.indent or {}, {
        enable = true,
        disable = { "yaml", "python" },
      })
    end,
  },
}
