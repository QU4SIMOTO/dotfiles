local vars = require("hyprland.vars")
local notes_dir = vars.home_dir .. "/notes"

hl.on("hyprland.start", function()
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("hyprpanel & hyprpaper")
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd("slack --enable-features=WebRTCPipeWireCapturer", { workspace = "1" })
	hl.exec_cmd(vars.browser, { workspace = "2" })
	hl.exec_cmd(vars.terminal .. " -e tmux new -As0", { workspace = "3" })
	hl.exec_cmd(
		vars.terminal .. " --working-directory=" .. notes_dir .. " -e nvim index.md",
		{ workspace = "special:notes" }
	)
end)
