-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------
-- source init.lua
keymap.set("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
keymap.set("n", "<leader>bx", ":bd<CR>", { noremap = true })

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<C-f>", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<space>fm", ":Telescope file_browser<CR>", { noremap = true })
keymap.set("n", "<C-p>", ":lua require'telescope'.extensions.project.project{}<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>") -- list available help tags

-- trouble
keymap.set("n", "<leader>lt", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })

-- bufferline
keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", { silent = true, noremap = true })

-- hop
keymap.set("n", "<leader>hw", "<cmd>HopWord<CR>", { silent = true, noremap = true })
keymap.set("n", "<leader>hc", "<cmd>HopChar2<CR>", { silent = true, noremap = true })

-- zen mode
keymap.set("n", "<leader>zm", "<cmd>ZenMode<CR>", { silent = true, noremap = true })

-- harpoon
keymap.set(
	"n",
	"<leader>hm",
	"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
	{ silent = true, noremap = true }
)
keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", { silent = true, noremap = true })
keymap.set("n", "<C-j>", "<cmd>lua require('harpoon.ui').nav_next()<CR>", { silent = true, noremap = true })
keymap.set("n", "<C-k>", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", { silent = true, noremap = true })
