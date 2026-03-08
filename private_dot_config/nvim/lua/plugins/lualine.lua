-- the thing that makes the bottom info look smexy
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },  -- Add a comma here
    config = function()  -- Use `config` to configure the plugin after it's loaded
        require('lualine').setup {
            options = {
                theme = 'tokyonight',  -- Choose your desired theme
                globalstatus = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            extensions = { 'fugitive' }  -- Optional: Add extensions, e.g., git fugitive
        }
    end
}
