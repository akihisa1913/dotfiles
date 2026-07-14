return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "moon",
		transparent = true,
		styles = {
			sidebars = "dark",
			floats = "dark",
		},
		on_highlights = function(hl, c)
			-- 通常の行番号を明るく（透過背景でも読めるように）
			hl.LineNr = { fg = c.fg_dark }
			-- 相対行番号の上下も少し明るく
			hl.LineNrAbove = { fg = c.fg_dark }
			hl.LineNrBelow = { fg = c.fg_dark }
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
}
