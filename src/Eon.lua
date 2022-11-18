local Eon = setmetatable({
	ESM = require(script.ESM),
	PlayerGui = require(script.Gui),
	Multiple = require(script.Multiple),
	Switch = require(script.ESM.Switch),
	MultipleTable = require(script.Multiple.MultipleTable),
	RefShare = require(script.New.RefShare),
	Step = require(script.Step)
}, {
	__call = require(script.New)
})

-- Read docs at https://www.github.com/thex810guy/Eon

-- When creating component, make sure to always assign 
-- a size or else it will not be visible (0 x 0 size)

return Eon