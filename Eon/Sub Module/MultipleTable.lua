local New = require(script.Parent.Parent.New)

local function mul(...)
	local results = {}
	
	for index, preComp in ipairs {...} do
		if typeof(index) ~= "number" then
			preComp[index] = New(nil, preComp)
		else
			table.insert(results, New(nil, preComp))
		end
	end
	
	return results
end

return mul