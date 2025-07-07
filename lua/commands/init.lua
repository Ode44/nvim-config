vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.bb", "*.bbappend", "*.bbclass", "*.inc", "conf/*.conf" },
  command = "set filetype=bitbake",
})

-- forcing lsp start
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.bb", "*.bbappend", "*.bbclass", "*.inc", "conf/*.conf" },
--   callback = function()
--     vim.lsp.start({
--       name = "bitbake",
--       cmd = { "bitbake-language-server", "--stdio" },
--       filetypes = { "bitbake" },
--     })
--   end,
-- })
