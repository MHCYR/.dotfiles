return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

		keymap.set(
			"n",
			"<leader>hm",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
			{ silent = true, noremap = true }
		)
		keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", { silent = true, noremap = true })
		keymap.set("n", "<C-n>", "<cmd>lua require('harpoon.ui').nav_next()<CR>", { silent = true, noremap = true })
		keymap.set("n", "<C-p>", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", { silent = true, noremap = true })
  end,
}