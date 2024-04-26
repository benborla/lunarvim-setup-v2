local status, lspConfig = pcall(require, 'lspconfig')
if (not status) then return end

-- Setup Vue
lspConfig.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact',  'typescriptreact', 'vue', 'json' },
}
