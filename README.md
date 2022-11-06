# Eon - UI Framework

This is a small introduction to Eon

## Components

In Eon to create components we call the module without brackets/parentheses like this "()"
We only need to put a table next to it.

Firstly, we'll add a Class in the Table

```
local Eon = require(script.Eon)

Component = Eon {
  Class = "Frame"
}
```

Now Eon knows that we are trying to create a Frame...
But we need to parent it so we are going to use!
`Eon.PlayerGui()`

> :information_source: This Function returns a ScreenGui which is only shared within your current script, meaning that calling this function on other localScripts will return a completely new screenGui

```
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

```
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

```
local module = {}

module.stylesheet1 = {
  BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White
}

module.stylesheet2 = {
  BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
}
```

We can see that according to our code's logic the Frame is going to have a White Background
But in the next script, it's gonna have a black background because in Eon when two stylesheets have the same properties the stylesheet further down the list shall 
make the change

```
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
## Changes
## Sub-components/Children
## State Management

All Coming Soon...
