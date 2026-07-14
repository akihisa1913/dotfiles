return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "診断一覧(全体)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "診断一覧(バッファ)" },
    { "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", desc = "参照一覧" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "TODO一覧" },
  },
  opts = {},
}
