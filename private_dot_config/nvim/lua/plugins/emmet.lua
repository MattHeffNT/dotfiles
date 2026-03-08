return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- Define the on_attach function
    local on_attach = function(client, bufnr)
      -- Set up key mappings and other buffer-local settings here
      -- For example, you can enable completion or set LSP key mappings for this buffer
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    end

    -- Setup for emmet_ls LSP
    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,  -- Attach the on_attach function
      filetypes = {
        "html",
        "css",
        "javascript",
        "javascriptreact",
        "typescriptreact",
      },
    })

    -- Ensure LSP functionality on these filetypes
    vim.cmd [[
      autocmd FileType html,css,javascriptreact,typescriptreact,vue setlocal filetype=html
    ]]
  end,
}

