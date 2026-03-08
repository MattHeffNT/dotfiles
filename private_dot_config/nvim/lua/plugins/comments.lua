return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function()
    require("Comment").setup({
      mappings = {
        basic = false, -- disable default 'gcc', 'gc' mappings
        extra = false,
      },
    })

    -- Add your custom mappings here
    vim.keymap.set("n", "<leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end, { desc = "Toggle comment line" })

    vim.keymap.set("v", "<leader>/", function()
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, { desc = "Toggle comment selection" })
  end,
}

