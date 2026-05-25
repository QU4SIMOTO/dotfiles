local vars = require("hyprland.vars")
local util = require("hyprland.keybinds.util")

local mainMod = util.mainMod
local floating_term = util.floating_term
local scratchpads = vars.scratchpads

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(vars.terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(vars.file_manager))
hl.bind(mainMod .. " + SPACE", floating_term("tlaunch", 0.4, 0.5))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + G", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
hl.bind(mainMod .. " + P", floating_term("~/work/dev-scripts/convert-montu-id"))
hl.bind(mainMod .. " + C", floating_term("clipse"))
hl.bind(mainMod .. " + D", floating_term("gh dash", 0.7, 0.8))
hl.bind(mainMod .. " + ESCAPE", floating_term("btop", 0.8, 0.8))
hl.bind(mainMod .. " + B", floating_term("bluetui"))

hl.bind(mainMod .. " + N", hl.dsp.workspace.toggle_special(scratchpads.notes.name))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.window.move({ workspace = scratchpads.notes.workspace }))

hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special(scratchpads.music.name))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = scratchpads.music.workspace }))
