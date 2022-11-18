local Types = require(script.Parent.Types)

local function WrongType(excepted, value)
	local s, _ = pcall(function()
		local res = Types:getType(value)
		
		if res ~= excepted then
			error ''
		end
	end)
	
	if s then
		return
	end
	
	assert(typeof(value) == excepted, "Wrong DataType execepted: "..excepted.." instead got: "..type(value))
end

return WrongType