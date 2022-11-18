local wrongType = require(script.Parent.Parent.WrongType)

local function changeListen(inst:Instance, data, comp)
	if not data.Change then return end
	
	local function apply(key, value)
		local function execute(...)
			local co = coroutine.create(value)
			coroutine.resume(co, comp, ...)
		end
		
		local function rawApply()
			wrongType("string", key)
			wrongType("function", value)
			
			inst:GetPropertyChangedSignal(key):Connect(execute)
		end
		
		local valid, res = pcall(rawApply)

		if not valid then
			warn(string.format(
				"Creation of Component was unsuccessful, change listening error. Full Error Message: \n\n %s",
				res
			))
			return
		end
	end
	
	for prop, func in pairs(data.Change) do
		apply(prop, func)
	end
end

return changeListen