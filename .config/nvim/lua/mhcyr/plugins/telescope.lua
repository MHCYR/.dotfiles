-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- configure telescope
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
			-- hidden = true
			search_dirs = { "./", "./components" },
			respect_gitignore = false,
		},
	},
	-- configure custom mappings
	defaults = {
		mappings = {
			i = {
				["<C-p>"] = actions.move_selection_previous, -- move to prev result
				["<C-n>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("project")
