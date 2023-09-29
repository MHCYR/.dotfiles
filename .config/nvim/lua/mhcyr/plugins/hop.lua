return {
  "phaazon/hop.nvim",
	event = { "BufReadPre", "BufNewFile" },
  config = function()
		require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>hw", "<cmd>HopWord<CR>", { silent = true, noremap = true })
		keymap.set("n", "<leader>hc", "<cmd>HopChar2<CR>", { silent = true, noremap = true })
  end,
}