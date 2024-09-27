local ESM = require(script.Parent.Parent.ESM)
local wrongType = require(script.Parent.Parent.WrongType)
local Clone = require(script.Parent.CopyTable)
local styleApply = require(script.Parent.StyleApply)

local Component = setmetatable({}, {
	__call = function(self, inst, data)
		local object = setmetatable({}, self)
		
		object._children = data.Children
		object._style = data.Style
		object._event = data.Event
		object._change = data.Change
		object.Instance = inst
		
		return object
	end
})

Component.__index = Component
Component._type = "Component"
Component._states = {}

function Component:appendChild(component)
	wrongType("Component", component)
	
	component.Instance.Parent = self.Instance
	self._children[#self._children + 1] = component
end

function Component:addStyle(style:table, overridePrevious:boolean)
	if overridePrevious == true then
		self._style[#self._style] = style
		local sampleT = {Style = {style}}
		
		styleApply(self.Instance, sampleT)
		sampleT = nil
	else
		self._style[#self._style + 1] = style
		local sampleT = {Style = {style}}

		styleApply(self.Instance, sampleT)
		sampleT = nil
	end
end

function Component:GetStates()
	return Clone(self._states)
end

function Component:AddState(name, allowNil, initValue, processFunc)
	local State = ESM.new(allowNil, initValue, processFunc)
	self._states[name] = State
end

function Component:GetState(name)
	return self._states[name]:GetAsync()
end

function Component:SetState(name, value, action)
	self._states[name]:UpdateAsync(value, action)
end

return Component