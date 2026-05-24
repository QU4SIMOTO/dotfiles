local M = {}

M.mainMod = "SUPER"

function M.floating_term(cmd, w, h)
	return hl.dsp.exec_cmd("ghostty -e " .. cmd, {
		float = true,
		center = true,
		size = { "(monitor_w*" .. (w or 0.5) .. ")", "(monitor_h*" .. (h or 0.5) .. ")" },
	})
end

return M
