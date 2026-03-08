local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit file" })
map("i", "jj", "<Esc>", {desc = "escape to normal"})


map("n", "<leader>/", "gcc", {desc = "comment out a line"})


-- -- Normal mode: <leader>c to toggle comment on current line
-- vim.keymap.set("n", "<leader>/", function()
--   require("Comment.api").toggle.linewise.current()
-- end, { desc = "Toggle comment line" })
--
-- -- Visual mode: <leader>c to toggle comment on selection
-- vim.keymap.set("v", "<leader>/", function()
--   require("Comment.api").toggle.linewise(vim.fn.visualmode())
-- end, { desc = "Toggle comment selection" })
--

