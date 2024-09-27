local ESM = {}
local Signal = require(script.Parent.QuentySignal)
local wrongType = require(script.Parent.WrongType)
local Switch = require(script.Switch)
local Step = require(script.Parent.Step)
local HttpService = game:GetService("HttpService")
ESM.__index = ESM

-- State Management is complex!
-- Read docs at https://www.github.com/thex810guy/Eon
	
function ESM.new(allowNil, initValue, processFunc)
	local function defaultProcess(value, input, action)
		if input == nil and allowNil == false then
			warn("State was assigned a nil value! resolving to previous value")
			return value
		end
		
		return Switch(action, function()
			return input
		end) {}
	end
	
	-- AllowNil will not work if you have a process
	-- function attached, you have to implement your
	-- -self
	
	local State = setmetatable({}, ESM)
	
	State._value = initValue
	State._process = processFunc or defaultProcess
	State.onChange = Signal.new()
	State._type = "State"
	
	return State
end

function ESM:GetAsync()
	return self._value
end

function ESM:SetAsync(value)
	-- Bypasses process function and onChange
	-- Kinda like rawset
	
	self._value = value
end

function ESM:UpdateAsync(value, action)
	local id = HttpService:GenerateGUID(false)
	
	Step.bindToRender(id, function()
		self._value = self._process(self._value, value, action)
		self.onChange:Fire()
		Step.unbindToRender(id)
	end)
end

return ESM