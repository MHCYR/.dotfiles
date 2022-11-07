local bufferline_setup, bufferline = pcall(require, "bufferline")
if not bufferline_setup then
	return
end

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	},
})
