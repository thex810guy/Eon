local wrongType = require(script.Parent.WrongType)
local applyStyle = require(script.StyleApply)
local eventBind = require(script.EventBinder)
local comp = require(script.Component)
local listenChange = require(script.ChangeListener)
local childrenAdd = require(script.ChildrenAdder)

local function RenderUI(inst, data)
	applyStyle(inst, data)
	
	local component = comp(inst, data)
	
	eventBind(inst, data, component)
	listenChange(inst, data, component)
	childrenAdd(inst, data, component)
	
	return component
end

local function New(_, data:table)
	wrongType("table", data); wrongType("string", data.Class);
	
	if data.Parent then
		wrongType("Instance", data.Parent)
	end
	
	local valid, res = pcall(Instance.new, data.Class)
	
	if not valid then
		warn(string.format(
			"Creation of Component was unsuccessful, class may be incorrect. Full Error Message: \n\n %s",
			res
		))
		return
	end
	
	res.Parent = data.Parent
	return RenderUI(res, data)
end

return New