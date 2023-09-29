-- import whichkey plugin safely
local setup, whichkey = pcall(require, "which-key")
if not setup then
	return
end

-- configure/enable whichkey
whichkey.setup({})
