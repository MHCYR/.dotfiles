return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-project.nvim"
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
			pickers = {
				find_files = {
					search_dirs = { "./", "./components" },
					follow = true, -- follows symlinks
				},
			},
			extensions = {
				project = {
					hidden_files = true, -- default: false
					theme = "dropdown",
				},
				file_browser = {
					hidden = true,
					respect_gitignore = false,
					cwd_to_path = true,
					hijack_netrw = true,
				},
			},
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
    telescope.load_extension("project")
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" }) -- find string in current working directory as you type
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
		keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
		keymap.set("n", "<space>fm", ":Telescope file_browser<CR>", { noremap = true })
		keymap.set("n", "<space>fp", ":lua require'telescope'.extensions.project.project{}<CR>", { noremap = true, silent = true })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>") -- list available help tags
  end,
}