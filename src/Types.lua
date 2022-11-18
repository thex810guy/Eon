local Types = {}

Types.validTypes = {
	"Component",
	"Step",
	"State"
}

function Types:getType(t:table)
	local Type = table.find(Types.validTypes, t._type)
	
	if not Type or typeof(t._type) ~= "string" then
		error "Invalid Type"
	end
	
	return Types.validTypes[Type]
end

return Types