local function Switch(value, default)
	return function(t)
		if t[value] then
			return t[value]()
		else
			return default()
		end
	end
end

return Switch