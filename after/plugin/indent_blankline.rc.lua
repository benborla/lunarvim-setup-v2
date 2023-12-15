local status, indent_blankline = pcall(require, 'indent_blankline')
-- if (not status) then return end

-- disabled by default, let the toggle handle this
vim.opt.list = false
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.cmd [[highlight Whitespace ctermfg=DarkGray]]

indent_blankline.setup {
  char = '│',
  space_char_blankline = ' ',
  show_current_context = true,
  show_current_context_start = true,
  use_treesitter = true,
  context_patterns = { 'class', 'function', 'method' },
  filetype_exclude = { 'help', 'packer', 'nvimtree', 'dashboard', 'neo-tree' },
  buftype_exclude = { 'terminal', 'nofile', 'quickfix' }
}

-- toggle the display of listchars
vim.api.nvim_set_keymap('', ';l', '<cmd>set list! list?<cr>', {})
