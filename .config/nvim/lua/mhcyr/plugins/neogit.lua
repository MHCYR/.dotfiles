return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"nvim-telescope/telescope.nvim", -- optional
		"sindrets/diffview.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup({})
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>G", "<cmd>Neogit<CR>", { silent = true, noremap = true })
		keymap.set("n", "<leader>gf", "<cmd>Neogit cwd=%:p:h<CR>", { silent = true, noremap = true })
	end,
}
