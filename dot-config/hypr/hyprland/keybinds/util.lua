local M = {}

M.mainMod = "SUPER"

function M.floating_term(cmd, w, h)
	return hl.dsp.exec_cmd("ghostty -e " .. cmd, {
		float = true,
		center = true,
		size = { "(monitor_w*" .. (w or 0.5) .. ")", "(monitor_h*" .. (h or 0.5) .. ")" },
	})
end

function M.toggle_proc(cmd)
	return hl.dsp.exec_cmd(string.format([[sh -c 'pgrep -x %q >/dev/null && pkill -x %q || %q &' ]], cmd, cmd, cmd))
end

return M
