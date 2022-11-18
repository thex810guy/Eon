local Step = {}
local wrongType = require(script.Parent.WrongType)
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
Step.__index = Step

if not _G.stepInit then
	local globalRunning = {}
	
	game:GetService("RunService").RenderStepped:Connect(function(...)
		for _, thread in pairs(globalRunning) do
			task.spawn(thread, ...)
		end
	end)
	
	_G.stepInit = globalRunning
end

function Step.bindToRender(name:string, func)
	wrongType("string", name)
	wrongType("function", func)
	assert(name:len() > 0, "string length must be > than 0")
	
	_G.stepInit[name] = func
end

function Step.unbindToRender(name:string)
	wrongType("string", name)
	
	if _G.stepInit[name] then
		_G.stepInit[name] = nil
	else
		warn(("unknown Render bind %q"):format(name))
	end
end

function Step.createStep(info:TweenInfo)
	local newStep = setmetatable({}, Step)
	newStep._info = info
	
	return newStep
end

function Step:execute(Component, prop:string, Goal:any)
	wrongType("Component", Component); wrongType("string", prop)
	
	local tween = TweenService:Create(
		Component.Instance,
		self._info,
		{prop = Goal}
	)
	tween:Play()
	
	return tween
end

function Step:executeWithGoals(Component, Goals:table)
	wrongType("Component", Component)
	
	local tween = TweenService:Create(
		Component.Instance,
		self._info,
		Goals
	)
	tween:Play()
	
	return tween
end

function Step:changeInfo(newInfo:TweenInfo)
	self._info = newInfo
end

return Step