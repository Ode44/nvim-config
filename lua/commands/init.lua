-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.bb", "*.bbappend", "*.bbclass", "*.inc", "conf/*.conf" },
--   command = "set filetype=bitbake",
-- })

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
