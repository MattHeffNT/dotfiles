-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
-- vim.g.lazyvim_prettier_needs_config = true
--

-- skip default neovim directory/explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- This tells Snacks to handle directory arguments
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      require("snacks").explorer.open()
    end
  end,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("CleanDirectoryTabs", { clear = true }),
--   callback = function(data)
--     -- If we just entered a directory buffer
--     if vim.fn.isdirectory(data.file) == 1 then
--       -- Schedule a wipeout so it doesn't interfere with the current render
--       vim.schedule(function()
--         if vim.api.nvim_buf_is_valid(data.buf) then
--           vim.cmd("bwipeout " .. data.buf)
--         end
--       end)
--     end
--   end,
-- })
