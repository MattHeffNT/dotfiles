return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show filtered (hidden) items like dotfiles
        hide_dotfiles = false, -- Do not hide dotfiles
        hide_gitignored = false, -- Optional: show .gitignored files too
      },
    },
  },
}
