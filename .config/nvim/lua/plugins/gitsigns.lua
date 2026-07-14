return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    current_line_blame = false,
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local map = function(mode, keys, fn, desc)
        vim.keymap.set(mode, keys, fn, { buffer = bufnr, desc = "Git: " .. desc })
      end

      map("n", "]c", gs.next_hunk, "次のハンクへ")
      map("n", "[c", gs.prev_hunk, "前のハンクへ")
      map("n", "<leader>hs", gs.stage_hunk, "ハンクをstage")
      map("n", "<leader>hr", gs.reset_hunk, "ハンクをreset")
      map("n", "<leader>hp", gs.preview_hunk, "ハンクをpreview")
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, "blame表示")
      map("n", "<leader>tb", gs.toggle_current_line_blame, "行末blameをtoggle")
    end,
  },
}
