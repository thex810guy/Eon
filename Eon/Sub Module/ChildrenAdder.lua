local wrongType = require(script.Parent.Parent.WrongType)

local function addChildren(inst:Instance, data, comp)
	if not data.Children then return end
	
	local function apply(key, value)
		wrongType("Component", value)
		
		local function rawApply()
			if key and typeof(key) ~= "number" then
				wrongType("string", key)
				value.Instance.Name = key
			end
						
			value.Instance.Parent = inst
		end
		
		local valid, res = pcall(rawApply)
		
		if not valid then
			warn(string.format(
				"Creation of Component was unsuccessful, children assignement error. Full Error Message: \n\n %s",
				res
			))
			return
		end
	end
	
	for name, subcomponent in pairs(data.Children) do
		apply(name, subcomponent)
	end
end

return addChildren