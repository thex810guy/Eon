local wrongType = require(script.Parent.Parent.WrongType)

local function process(inst, data)
	if not data.Style then return end
	
	local function apply(key, value)
		local function rawApply()
			wrongType(typeof(inst[key]), value)
			
			inst[key] = value
		end
		
		local valid, res = pcall(rawApply)
		
		if not valid then
			warn(string.format(
				"Creation of Component was unsuccessful, stylesheet error. Full Error Message: \n\n %s",
				res
			))
			return
		end
	end
	
	for _, stylesheet in ipairs(data.Style) do
		for k, v in pairs(stylesheet) do
			apply(k, v)
		end
	end
end

return process
