# Eon - UI Framework 0.9.8

This is a small introduction to Eon

## Components

In Eon to create components we call the module without brackets/parentheses like this "()"
We only need to put a table next to it.
Firstly, we'll add a Class in the Table

```lua
local Eon = require(script.Eon)

Component = Eon {
  Class = "Frame"
}
```

Now Eon knows that we are trying to create a Frame...
But we need to parent it so we are going to use!
`Eon.PlayerGui()`

> :information_source: This Function returns a ScreenGui which is only shared within your current script, meaning that calling this function on other localScripts will return a completely new screenGui

```lua
local Eon = require(script.Eon)

Component = Eon {
  Class = "Frame"
  Parent = Eon.PlayerGui()
}
```

## Stylesheets

Eon works like CSS, it uses stylesheets which are basically (in Eon not CSS) tables with properties inside.
Stylesheets are assigned via Component.Style

The following script has a module called Stylesheets containing several stylesheet:

```lua
local Eon = require(script.Eon)
local Stylesheets = require(script.Stylesheets)

Component = Eon {
  Class = "Frame",
  Parent = Eon.PlayerGui(), -- Returns a screenGui created by Eon
  
  Style = {
    Stylesheets.stylesheet1
  }
}
```

Stylesheets Module:

```lua
local module = {}

module.stylesheet1 = {
  BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White
}

module.stylesheet2 = {
  BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
}
```

We can see that according to our code's logic the Frame is going to have a White Background
But in the next script, it's gonna have a black background because in Eon when two stylesheets have the same properties the stylesheet further down the list is more important and thus will override the previous property

```lua
local Eon = require(script.Eon)
local Stylesheets = require(script.Stylesheets)

Component = Eon {
  Class = "Frame",
  Parent = Eon.PlayerGui(), -- Returns a screenGui created by Eon
  
  Style = {
    Stylesheets.stylesheet1,
    Stylesheets.stylesheet2
  }
}
```

## Events

In Eon, events can binded directly within the constructor function,
By adding a new key called "Event" then assigning a dictionary
The key of dictionary must be the name of the RbxEvent and the value must be the function that will be binded

```lua
local Eon = require(script.Eon)
local Scripts = require(script.Scripts)

local component = Eon {
	Class = "TextButton",
	Parent = Eon.PlayerGui(),
	
	Event = {
		Activated = Scripts.doSomething
	},
}
```

Scripts module:

```lua
local module = {}

function module.doSomething(component, inputObject, times)
  print("This button was clicked "..tostring(times).." times in a row")
end

function module.doSomethingElse(component)
  print("Yay!")
end
```

> :information_source: component argument is more advanced, therefore goto Advanced to learn about it

### Changes

You may wonder "Why is there another function?!?"
Because we are going to do changes next!!
It's almost identical to Event except it uses propertyName instead!
We'll change the class to TextBox for the sake of this tutorial

```lua
local Eon = require(script.Eon)
local Scripts = require(script.Scripts)

local component = Eon {
	Class = "TextButton",
	Parent = Eon.PlayerGui(),
	
	Event = {
		Activated = Scripts.doSomething
	},
        Change = {
          Text = Scripts.doSomethingElse
        }
}
```

## Sub-components/Children

In Eon, the easiest wait to add children is this:

```lua
local Eon = require(script.Eon)
local Scripts = require(script.Scripts)

local component = Eon {
	Class = "TextButton",
	Parent = Eon.PlayerGui(),
	
	Children = Eon.MultipleTable(
		{
			Class = "UIPadding"
		},
		{
			Class = "UICorners"
		}
	)
}
```

We'll explain the code later on


## State Management

> 🧱 Sorry! Under Construction

### With Rodux

Rodux support not yet

# Advanced

## Api Reference

### Components

### Eon

### Spring

## Projects

### To-do list

### Search plugin

### Responsive Notification System

# Credits, information and planed addons

## Credits

I got inspiration from Elttob's Fusion Ui Framework and Roblox Roact:
[Fusion](https://elttob.uk/Fusion/)
[Roact](https://roblox.github.io/roact/)

### Version format

*edition.update.bug-fixes*

Editions will be newer and older versions of Eons. Note older edition will still be supported! New editions are completely differents eachothers.
Update that all editions will recieve, those are addons.
Bug Fixes are self explainatory

### Planned Addons

Rodux support. Instance to Component Conversion

## Version 0.9.8 - Prerelease

Yes it's infact the pre release, don't expect anything crazy right now.
