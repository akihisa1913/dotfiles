return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "python", "typescript", "tsx", "javascript",
        "lua", "markdown", "markdown_inline",
        "json", "yaml", "toml", "bash", "vim", "vimdoc",
        "terraform", "hcl",
      },
      highlight = { enable = true }, -- Tree-sitter ハイライト有効化
      indent = { enable = true },    -- Tree-sitter ベースのインデント
    })
  end,
}
