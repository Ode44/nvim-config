-- be creative --

vim.g.mapleader = " "

--tree
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--windows/buffers/tabs
vim.keymap.set("n", "<A-h>", "<CMD> :split<CR><C-w>w",  {desc = "Horizontal split"})
vim.keymap.set("n", "<A-v>", "<CMD>:vsplit<CR><C-w>w",  {desc =   "Vertical split"})


--CMDS--

--these are useful we can reload whole file or deliberate part of it (line or higlighted block or something)
vim.keymap.set("n", "<leader><leader>x", "<CMD>:source %<CR>", {desc = "Execute current file"})
vim.keymap.set("n", "<leader>x", ":.lua<CR>", {desc = "Execute current line"})
vim.keymap.set("v", "<leader>x", ":lua<CR>",  {desc = "Execute higlited (I GUESS)"})


