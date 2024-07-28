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
				java = "javac " .. file .. " && java " .. vim.fn.fnamemodify(file, ":r"),
				c = "clear && gcc -o out " .. file .. " && ./out",
				javascript = "node " .. file,
				typescript = "ts-node " .. file,
			}
			return ft_cmds[vim.bo.ft]
		end,
	})
end

return M
