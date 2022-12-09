local setup, twilight = pcall(require, "twilight")
if not setup then
	return
end

-- configure/enable whichkey
twilight.setup({})
