local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup({
	nextls = {
		enable = true, -- defaults to false
		-- port = 9000, -- connect via TCP with the given port. mutually exclusive with `cmd`. defaults to nil
		-- cmd = "path/to/next-ls", -- path to the executable. mutually exclusive with `port`
		init_options = {
			mix_env = "dev",
			mix_target = "host",
			experimental = {
				completions = {
					enable = false, -- control if completions are enabled. defaults to false
				},
			},
		},
		on_attach = function(client, bufnr)
			-- custom keybinds
		end,
	},

	elixirls = {
		enable = true,
		repo = "mhanberg/elixir-ls", -- defaults to elixir-lsp/elixir-ls
		branch = "mh/all-workspace-symbols",

		cmd = "/home/shanu/.cache/nvim/elixir-tools.nvim/installs/elixir-lsp/elixir-ls/tags_v0.22.0/1.17.2-27/language_server.sh",

		settings = elixirls.settings({
			dialyzerEnabled = true,
			fetchDeps = false,
			enableTestLenses = false,
			suggestSpecs = false,
		}),
		on_attach = function(client, bufnr)
			vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
			vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
			vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
		end,
	},
})
