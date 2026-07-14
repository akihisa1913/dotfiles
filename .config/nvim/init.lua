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

require("config.lazy")
