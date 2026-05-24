local M = {}

M.home_dir = os.getenv("HOME")
M.work_dir = M.home_dir .. "/work"
M.terminal = "ghostty"
M.file_manager = "yazi"
M.menu = "wofi --show drun"
M.music = "spotify - launcher"
M.browser = "firefox"

M.scratchpads = {
	notes = { name = "notes", workspace = "special:notes" },
	music = { name = "music", workspace = "special:music" },
}

return M
