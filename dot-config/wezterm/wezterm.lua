local wezterm = require("wezterm")

return {
	font = wezterm.font("Hack Nerd Font Mono"),
	font_size = 18.0,
	window_background_opacity = 0.75,
	enable_tab_bar = false,
	front_end = "WebGpu",
	term = "xterm-256color",
	window_padding = {
		left = 6,
		right = 6,
		top = 6,
		bottom = 6,
	},
}
