local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.termguicolors = true
opt.scrolloff = 8 
vim.opt.fillchars='eob: '

vim.opt.termguicolors = true
vim.cmd.colorscheme "tokyonight"


-- Enable clipboard support for system clipboard (unnamedplus)
vim.opt.clipboard:append("unnamedplus")

    vim.g.clipboard = {
        name = "win32yank-wsl",
        copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
            ["+"] = "win32yank.exe -o --lf",
            ["*"] = "win32yank.exe -o --lf",
        },
        cache_enabled = true,
    }
