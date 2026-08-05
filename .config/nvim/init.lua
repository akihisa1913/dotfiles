local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"

-- 検索
opt.ignorecase = true
opt.smartcase = true

-- インデント
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- 画面・表示
opt.scrolloff = 8
opt.splitright = true
opt.splitbelow = true
opt.signcolumn = "yes"
opt.termguicolors = true

-- 永続undo・応答性
opt.undofile = true
opt.updatetime = 250

-- 診断表示
vim.diagnostic.config({
  -- カーソル行の診断だけ下に全文展開する(pyright の型エラーは長文になりがちなため)
  virtual_lines = { current_line = true },
  virtual_text = { prefix = "●", spacing = 2 },
  severity_sort = true,
  float = { border = "rounded", source = true },
})

-- cmux でmarkdown previewを表示する
vim.cmd([[cnoreabbrev cmuxmd cmux markdown open]])

require("config.lazy")
