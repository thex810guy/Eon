local New = require(script.Parent.New)

local function mul(...)
	local results = {}
	
	for _, preComp in ipairs {...} do
		table.insert(results, New(nil, preComp))
	end
	
	return unpack(results)
end

return mul
