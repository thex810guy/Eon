--!nocheck
-- Eon Syntax

local Eon = require(0) -- placeholder 0 change to the path to eon
local Stylesheets = require(1) -- again placeholder number
local Scripts = require(2) -- placeholder number

-- No Brackets/Parentheses needed

--[[
A component is function called to create a new GUI
object,
It requires a Class in order to be created
otherwise the framework cannot call Instance.new
because there's no Class
--]]

local component = Eon {
	-- eg: TextButton
	Class = "Class name of the GUI Object",
	
	-- Everything is optional except Class,
	-- so you can create components without Style = {...}
	
	Style = {
		Stylesheets.CoolButton,
		Stylesheets.NiceBackground,
		Stylesheets.ChildishBackground
		--[[
		A stylesheet is a dictionary, its key is a propertyName
		and the value is property value.
		In Eon we can have multiple Stylesheets.
		
		Let's suppose that NiceBackground and Childish
		-Background both change the backgroundColor3
		property,
		
		ChildishBackground will override NiceBackground.
		Because it's further down the Styles array
		--]]
	},
	
	Event = {
		eventname = Scripts.doSomething,
		differentEventName = Scripts.doSomethingElse
		
		--[[
		An Events is literally a Instance's Event,
		Such as Activated when a TextButton is clicked.
		The key is the event's name and the value is
		the function that has to be binded to the event. 
		
		Events names can't be the same because
		it's a dictionnary...
		
		If you assign a value with already defined key,
		the new value will override the previous key's
		value.
		--]]
	},
	
	Changes = {
		--[[
		Simillar to Events except it listens for
		properties change
		eg: The text property changed so the function
		that listens for text change is fired.
		--]]
		PropertyName = Scripts.onChange,
		Text = Scripts.onTextChange
	},
	
	Children = {
		--[[
		A child is a component parented to the component
		you just created.
		It has the same requirements.
		--]]
		
		Child = Eon {
			Class = "Frame",
			
			-- blah blah blah
		}
	}
}