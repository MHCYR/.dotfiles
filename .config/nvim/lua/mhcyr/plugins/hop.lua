-- import hop plugin safely
local status, hop = pcall(require, "hop")
if not status then
	return
end

hop.setup()
