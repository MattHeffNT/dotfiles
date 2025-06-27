-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Inoremap jj to escape insert mode
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

local map = vim.keymap.set

-- Remap <leader>c to delete current buffer
map("n", "<leader>c", ":bp|bd #<CR>", { desc = "Delete current buffer" })

vim.api.nvim_del_keymap("n", "s")
