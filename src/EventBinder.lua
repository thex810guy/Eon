local wrongType = require(script.Parent.Parent.WrongType)
local refShare = require(script.Parent.RefShare)

local function bindEvent(inst, data, comp)
	if not data.Event then return end
	
	local function apply(key, value)
		local function execute(...)
			local co = coroutine.create(value)
			coroutine.resume(co, comp, ...)
		end
		
		local function rawApply()
			wrongType("RBXScriptSignal", inst[key])
			
			if typeof(value) == "userdata" then
				refShare.Interpret(inst[key], value, comp)
			else
				wrongType("function", value)
				inst[key]:Connect(execute)
			end
		end
		
		local valid, res = pcall(rawApply)

		if not valid then
			warn(string.format(
				"Creation of Component was unsuccessful, event binding error. Full Error Message: \n\n %s",
				res
			))
			return
		end
	end

	for event, func in pairs(data.Event) do
		apply(event, func)
	end
end

return bindEvent