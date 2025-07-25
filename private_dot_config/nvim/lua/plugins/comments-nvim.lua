return {
  {
    "numToStr/Comment.nvim",
    opts = {},
    config = function(_, opts)
      local comment = require("Comment")
      comment.setup(opts)

      -- Keymap overrides
      local map = vim.keymap.set
      local api = require("Comment.api")

      -- Normal mode: Toggle comment
      map("n", "<leader>/", api.toggle.linewise.current, {
        desc = "Toggle comment",
        noremap = true,
        silent = true,
      })

      -- Visual mode: Toggle comment
      map("v", "<leader>/", function()
        api.toggle.linewise(vim.fn.visualmode())
      end, {
        desc = "Toggle comment (visual)",
        noremap = true,
        silent = true,
      })
    end,
  },
}
