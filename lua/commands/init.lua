--forcing lsp start
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.bb", "*.bbappend", "*.bbclass", "*.inc", "conf/*.conf" },
  callback = function()
    vim.lsp.start({
      name = "bitbake",
      cmd = { "language-server-bitbake", "--stdio" },
      filetypes = { "bitbake" },
    })
  end,
})

--do not paste comment symbols on enter being on comment line
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

--should widen an active vertical buffer/window
local function resize_on_focus()
  local max_width = 0.65
  local total_width = vim.o.columns
  local focused_width = math.floor(total_width * max_width)
  local unfocused_width = math.floor((total_width - focused_width) / (#vim.api.nvim_tabpage_list_wins(0) - 1))

  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local win_cfg = vim.api.nvim_win_get_config(win)

    --skip floating windows or window where relative not specified
    if type(win_cfg.relative) ~= "string" or win_cfg.relative ~= "" then
      goto continue
    end

    if vim.api.nvim_get_current_win() == win then
      vim.api.nvim_win_set_width(win, focused_width)
    else
      vim.api.nvim_win_set_width(win, unfocused_width)
    end
    ::continue::
  end
end

vim.api.nvim_create_autocmd({ "WinEnter" }, {
  callback = function()
    if #vim.api.nvim_tabpage_list_wins(0) < 2 then
      return
    end
    resize_on_focus()
  end,
})
