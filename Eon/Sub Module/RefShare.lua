local module = {}

function module.Share(...)
	local ref = newproxy(true)
	getmetatable(ref).__index = {...}
	
	return ref
end

function module.Interpret(event, fakeRef, comp)
	local ref = getmetatable(fakeRef).__index
	
	local function execute(...)
		local cloneRef = table.clone(ref)
		local co = coroutine.create(cloneRef[#ref])
		table.remove(cloneRef, #ref)
		coroutine.resume(co, comp, unpack(cloneRef), ...)
	end
	
	event:Connect(execute)
end

return module
