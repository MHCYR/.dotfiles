local setup, zen = pcall(require, "zen-mode")
if not setup then
	return
end

-- configure/enable whichkey
zen.setup({})
