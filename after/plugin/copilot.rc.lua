local status, copilot = pcall(require, 'copilot')
if (not status) then return end

-- vim.g.copilot_filetype = { xml = false }
vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["dart"] = true,
  ["typescript"] = true,
  ["php"] = true,
  ["lua"] = true,
  ["rust"] = true,
  ["c"] = false,
  ["c#"] = false,
  ["c++"] = false,
  ["go"] = false,
  ["python"] = false,
}
