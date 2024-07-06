local M = {}

M.run_file = function()
	require("nvchad.term").runner({
		id = "htoggleTerm",
		pos = "sp",
		cmd = function()
			local file = vim.fn.expand("%")
			local ft_cmds = {
				python = "python3 " .. file,
				cpp = "clear && g++ -o out " .. file .. " && ./out",
			}
			return ft_cmds[vim.bo.ft]
		end,
	})
end

return M
