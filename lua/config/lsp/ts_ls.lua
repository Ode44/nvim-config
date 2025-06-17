vim.lsp.start({
  cmd = {'typescript-language-server'},
  filetypes = {'js', 'jsx', 'ts', 'tsx', 'mjs', 'cjs', 'ejs'},
  root_markers = {'package.json', 'index.js', 'main.ts'},
})
