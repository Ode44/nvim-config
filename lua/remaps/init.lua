-- BE CREATIVE --

vim.g.mapleader = " "
local k = vim.keymap

--editing
vim.keymap.set("v", "<S-J>", ":m '>+1<CR>gv=gv") -- Moving rows to the Top
vim.keymap.set("v", "<S-K>", ":m '>-2<CR>gv=gv") -- Moving rows to the Top

vim.keymap.set({ "v" }, "<leader>c", '"+y', { desc = "Copy into the system-wide clipboard" })
vim.keymap.set({ "v" }, "<leader>d", '"_d', { desc = "Send highlighted stuf into the void" })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })

--windows/buffers/tabs
vim.keymap.set("n", "<A-h>", "<CMD> :split<CR><C-w>w", { desc = "Horizontal split" })
vim.keymap.set("n", "<A-v>", "<CMD>:vsplit<CR><C-w>w", { desc = "Vertical split" })

--plugins
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Escape to normal mode in terminal" })

--telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fa", builtin.live_grep)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>fb", builtin.buffers)

--these are useful we can reload whole file or deliberate part of it (line or highlighted block or something)
vim.keymap.set("n", "<leader><leader>x", "<CMD>:source %<CR>", { desc = "Execute current file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Execute current line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Execute highlited (I GUESS)" })

-------------------
--- CUSTOM REMAPS ---
-------------------

--terminal that spans across vertical bufs
vim.keymap.set({ "n" }, "<leader>tt", function()
  --loop through windows if there one with t buftype kill it
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_win_close(win, true)
      vim.api.nvim_buf_delete(buf, { force = true })
      return
    end
  end

  local max_height = 0.28 --percentage
  local window_height = math.floor(vim.o.lines * max_height)
  vim.cmd("botright" .. window_height .. "split | terminal")
  --make sure insert starts after terminal was open
  vim.schedule(function()
    vim.cmd("startinsert")
  end)
end, { desc = "Open terminal in the bottom split" })

--clear notifications
--looks like I dont use it often
k.set("n", "<leader>sw", function()
  require("notify").dismiss()
end, { desc = "Screen Wipe or swipe" })

--open link in the browser (doesn't work tho)
vim.keymap.set("n", "<leader>go", function()
  local target = vim.fn.expand("<cWORD>")

  if target:match("https?://[%w%p]+") then
    vim.notify("Opening URL: " .. target)
    vim.fn.jobstart({ "xdg-open", target }, { detach = true })
    return
  end
  vim.api.nvim_echo({ { "Not a valid URL target: " .. target, "WarningMsg" } }, false, {})
end, { desc = "Opens hyperlink in a browser" })
