local lsp_servers = {
  lua        = "lua_ls",
  rust       = "rust_analyzer",
  javascript = "tsserver",
  typescript = "tsserver",
  python     = "pyright",
}

for filetype, lsp in pairs(lsp_servers) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function()
      local ok, config = pcall(require, "lsp." .. filetype)
      if ok and config ~= false then
        vim.lsp.enable(lsp, config)
      else
        vim.lsp.enable(lsp)
      end
    end,
  })
end

