local isInit = false

local function plrGui(name)
	local plrGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui", 1)
	
	if isInit == false then
		local screenGui = Instance.new("ScreenGui")
		
		screenGui.Name = name or "EonGui"
		screenGui.Parent = plrGui
		
		isInit = screenGui
		return isInit
	elseif isInit then
		return isInit
	end
end

return plrGui
