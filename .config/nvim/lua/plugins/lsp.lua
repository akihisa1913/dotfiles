return {
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		opts = {
			-- Python: pyright(型/補完/ジャンプ) + ruff(lint/format), TypeScript/JS: vtsls
			-- Terraform: terraformls(補完/ジャンプ/validate 診断、terraform CLI が PATH に必要)
			ensure_installed = { "pyright", "ruff", "vtsls", "terraformls" },
		},
		config = function(_, opts)
			-- blink.cmp の補完 capabilities を全 LSP サーバーに適用
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			require("mason-lspconfig").setup(opts)

			-- LSP がバッファにアタッチしたら、そのバッファ限定でキーマップを設定
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local tb = require("telescope.builtin")
					local map = function(keys, fn, desc)
						vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = "LSP: " .. desc })
					end

					map("gd", tb.lsp_definitions, "定義元へジャンプ")
					map("grr", tb.lsp_references, "参照一覧")
					map("gri", tb.lsp_implementations, "実装一覧")
					map("gy", tb.lsp_type_definitions, "型定義へジャンプ")
					-- フォーマットは <leader>f (conform.nvim) に一本化
					-- K(ホバー), grn(リネーム), gra(コードアクション) は nvim 0.11 の標準割当を使用
				end,
			})
		end,
	},
}
