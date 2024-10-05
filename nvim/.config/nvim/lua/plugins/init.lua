--configuration for Neovide
if vim.g.neovide then
	vim.g.neovide_scale_factor = 0.8

	vim.g.neovide_hide_mouse_when_typing = false
end

for i = 1, 9, 1 do
	vim.keymap.set("n", string.format("<A-%s>", i), function()
		vim.api.nvim_set_current_buf(vim.t.bufs[i])
	end)
end

-- vscode format i.e json files
vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/my_snippets"

--
-- vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
-- 	callback = function()
-- 		vim.t.bufs = vim.tbl_filter(function(bufnr)
-- 			return vim.api.nvim_buf_get_option(bufnr, "modified")
-- 				or vim.api.nvim_buf_get_option(bufnr, "buftype")
-- 				or vim.api.nvim_buf_get_name(bufnr):match("diffpanel_3") == ""
-- 		end, vim.t.bufs)
-- 	end,
-- })
--
local flutter = require("configs.flutter")
vim.api.nvim_create_user_command("FlutterTest", flutter.flutter_test, {})
vim.api.nvim_create_user_command("FindHardcodedStrings", flutter.find_hardcoded_strings, {})

return {

	{
		"folke/which-key.nvim",
		lazy = false, -- disables lazy loading
	},

	{
		"tpope/vim-fugitive",
		cmd = "Git",
	},

	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
		},
		config = function()
			require("configs.undotree")
		end,
	},

	{
		"CRAG666/betterTerm.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			position = "bot",
			size = 15,
		},
		config = function()
			require("configs.betterterm")
		end,
	},

	{
		"CRAG666/code_runner.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.code-runner")
		end,
	},
	{
		"elixir-tools/elixir-tools.nvim",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.elixir-tools")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
	},

	{
		"akinsho/flutter-tools.nvim",
		ft = "dart",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = function()
			require("configs.flutter-tools")
		end,
	},

	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			require("configs.lint")
		end,
	},

	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		config = function()
			require("configs.conform")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"html-lsp",
				"css-lsp",
				"prettier",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"javascript",
			},
		},
	},

	{
		"barrett-ruth/live-server.nvim",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
	},
}
