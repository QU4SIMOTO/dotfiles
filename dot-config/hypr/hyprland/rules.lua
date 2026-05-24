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
