-- be creative --

vim.g.mapleader = " "

--windows/buffers/tabs
vim.keymap.set("n", "<A-h>", "<CMD> :split<CR><C-w>w",  { desc = "Horizontal split" })
vim.keymap.set("n", "<A-v>", "<CMD>:vsplit<CR><C-w>w",  { desc =   "Vertical split" })

--plugins
vim.keymap.set({"t", "n"}, "<leader>tt", "<CMD>Fterm<CR>", { desc = "Open or close floating term" })
vim.keymap.set("n", "<leader>ff", "<CMD>FZF<CR>", {  desc = "Fuzzy finder from curent workdir" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Escape to normal mode in terminal"})

--these are useful we can reload whole file or deliberate part of it (line or higlighted block or something)
vim.keymap.set("n", "<leader><leader>x", "<CMD>:source %<CR>", { desc = "Execute current file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Execute current line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>",  { desc = "Execute higlited (I GUESS)" })


