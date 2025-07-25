-- Inoremap jj to escape insert mode
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Delete unneeded mappings (optional, if you previously set them)
vim.api.nvim_del_keymap("n", "s")

local map = vim.keymap.set
local comment_api = require("Comment.api")

-- Delete current buffer with <leader>c
local map = vim.keymap.set

local function delete_buffer()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs > 1 then
    vim.cmd("bnext")
    vim.cmd("bdelete #")
  else
    -- Just delete current buffer if only one left (will open empty buffer)
    vim.cmd("bdelete")
  end
end

map("n", "<leader>c", delete_buffer, { desc = "Delete current buffer", noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
