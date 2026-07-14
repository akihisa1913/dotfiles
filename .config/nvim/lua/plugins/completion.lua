return {
  "saghen/blink.cmp",
  -- リリースタグを使うとビルド済みバイナリを自動DL（cargoビルド不要）
  version = "*",
  event = "InsertEnter",
  opts = {
    keymap = { preset = "super-tab" }, -- <Tab>で確定, <C-space>で補完, <C-n>/<C-p>で選択
    appearance = { nerd_font_variant = "mono" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
  },
  opts_extend = { "sources.default" },
}
