require("nvchad.mappings")
local map = vim.keymap.set
local nomap = vim.keymap.del

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "selected text move down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "selected text move " })

map("n", "J", "mzJ`z")

map("n", "<C-d>", "<C-d>zz", { desc = "half page scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "helf page scroll up" })

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>o", "o<ESC>", { desc = "Insert line below in normal mode" })
map("n", "<leader>O", "O<ESC>", { desc = "Insert line above in normal mode" })

-- greatest remap ever
map("x", "<leader>p", [["_dP]], { desc = "delete and paste" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "permanent delete" })

map("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "renaming using regex" })

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--quick fix and location list
vim.keymap.set("n", "]q", ":cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "[q", ":cprev<CR>zz", { desc = "Previous quickfix item" })
vim.keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "Open quickfix list" })
vim.keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = "Close quickfix list" })

vim.keymap.set("n", "]l", ":lnext<CR>zz", { desc = "Next location list item" })
vim.keymap.set("n", "[l", ":lprev<CR>zz", { desc = "Previous location list item" })
vim.keymap.set("n", "<leader>lo", ":lopen<CR>", { desc = "Open location list" })
vim.keymap.set("n", "<leader>lc", ":lclose<CR>", { desc = "Close location list" })

--lsp keymap
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Show signature help" })
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show hover" })
map("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
map("n", "<leader>K", vim.lsp.buf.hover, { desc = "Show hover" })

-- map(
--   "x",
--   "<leader>ca",
--   vim.lsp.buf.range_code_action,
--   { noremap = true, desc = "Open code actions for the selected visual range" }
-- )

map("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

map("n", "<leader>ra", function()
	require("nvchad.lsp.renamer")()
end, { desc = "NvRenamer" })
nomap("n", "<leader>ds") -- move to diagnostic list
map("n", "<leader>qe", function()
	vim.diagnostic.setqflist({ open = false })
end, { desc = "Set quickfix list with diagnostics (Error Quickfix)" })
nomap("n", "<leader>e")
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
nomap("n", "<C-s>")

nomap("n", "<C-h>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<C-l>")

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true, noremap = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true, noremap = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true, noremap = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true, noremap = true })
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", { silent = true, noremap = true })

map("n", "<leader>rc", function()
	require("configs.runner").run_file()
end, { desc = "run file" })
