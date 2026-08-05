return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
  },
  opts = {
    window = {
      -- 左サイドバーにファイルツリーを表示
      position = "left",
      width = 35,
    },
    filesystem = {
      -- ディレクトリを開いたら netrw の代わりに Neo-tree を使う
      hijack_netrw_behavior = "open_default",
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
