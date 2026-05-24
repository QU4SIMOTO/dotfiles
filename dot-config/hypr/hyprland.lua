---------------------
---- MY PROGRAMS ----
---------------------
local terminal = "alacritty"
local fileManager = "dolphin"
local menu = "wofi --show drun"
local music = "spotify - launcher"
local browser = "firefox"

local home = os.getenv("HOME")
-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("hyprpanel & hyprpaper")
	hl.exec_cmd("wl-clipboard-history -t")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("rm " .. home .. "/.cache/cliphist/db")

	hl.exec_cmd("slack --enable-features=WebRTCPipeWireCapturer", { workspace = "1" })
	hl.exec_cmd(browser, { workspace = "2" })
	hl.exec_cmd(terminal .. " -e tmux new -As0", { workspace = "3" })
	hl.exec_cmd(terminal .. " --working-directory ~/notes -e nvim ~/notes/index.md", { workspace = "special:notes" })
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("GDK_BACKEND", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("GRIM_DEFAULT_DIR", home .. "/screenshots")
hl.env("WORK_DIR", home .. "/work")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
	general = {
		gaps_in = 1,
		gaps_out = 1,
		border_size = 1,
		col = {
			active_border = {
				colors = {

					"rgba(6D8E8FEE)",
					"rgba(6D8E8FEE)",
				},
				angle = 45,
			},
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 2,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},
		blur = {
			enabled = false,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
	animations = {
		enabled = false,
	},
})

hl.config({
	dwindle = {
		force_split = 2,
		preserve_split = true, -- You probably want this
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------
hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

---------------
---- INPUT ----
---------------
hl.config({
	input = {
		kb_layout = "gb",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER" -- Sets "Windows" key as main modifier
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(
	mainMod .. " + Q",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. "+ SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. "+ SHIFT + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. "+ SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. "+ SHIFT + J", hl.dsp.window.swap({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind("ALT + H", hl.dsp.focus({ workspace = "1" }))
hl.bind("SHIFT + ALT_L + H", hl.dsp.window.move({ workspace = "1" }))
hl.bind("ALT + J", hl.dsp.focus({ workspace = "2" }))
hl.bind("SHIFT + ALT_L + J", hl.dsp.window.move({ workspace = "2" }))
hl.bind("ALT + K", hl.dsp.focus({ workspace = "3" }))
hl.bind("SHIFT + ALT_L + K", hl.dsp.window.move({ workspace = "3" }))
hl.bind("ALT + L", hl.dsp.focus({ workspace = "4" }))
hl.bind("SHIFT + ALT_L + L", hl.dsp.window.move({ workspace = "4" }))
hl.bind("ALT + SEMICOLON", hl.dsp.focus({ workspace = "5" }))
hl.bind("SHIFT + ALT_L + SEMICOLON", hl.dsp.window.move({ workspace = "5" }))

-- notes scratchpad
hl.bind(mainMod .. " + N", hl.dsp.workspace.toggle_special("notes"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.window.move({ workspace = "special:notes" }))

-- music scratchpad
hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:music" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshot (grab) to clipboard
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))

-- Screenshot (grab) and save
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.workspace_rule({
	workspace = "1",
	monitor = "desc:Dell Inc. DELL G3223Q 702Q8P3",
})
hl.workspace_rule({
	workspace = "2",
	monitor = "desc:Dell Inc. DELL G3223Q 702Q8P3",
	default = true,
})
hl.workspace_rule({
	workspace = "3",
	monitor = "desc:Dell Inc. DELL G3223Q 702Q8P3",
})
hl.workspace_rule({
	workspace = "4",
	monitor = "desc:Dell Inc. DELL G3223Q 702Q8P3",
})
hl.workspace_rule({
	workspace = "5",
	monitor = "desc:Dell Inc. DELL G3223Q 702Q8P3",
})
hl.workspace_rule({
	workspace = "6",
	monitor = "desc:eDP-1",
	default = true,
})
