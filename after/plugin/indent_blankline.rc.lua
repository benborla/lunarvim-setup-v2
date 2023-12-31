local status, indent_blankline = pcall(require, 'indent_blankline')
if (not status) then return end


vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#F23131 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- disabled by default, let the toggle handle this
vim.opt.list = false
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.cmd[[highlight Whitespace ctermfg=DarkGray]]

indent_blankline.setup {
  show_current_context = true,
  show_current_context_start = true,
  -- show_end_of_line = true,
  space_char_blankline = " ",
  -- char_highlight_list = {
  --     "IndentBlanklineIndent1",
  --     "IndentBlanklineIndent2",
  --     "IndentBlanklineIndent3",
  --     "IndentBlanklineIndent4",
  --     "IndentBlanklineIndent5",
  --     "IndentBlanklineIndent6",
  -- }
}

-- toggle the display of listchars
vim.api.nvim_set_keymap('', ';l', '<cmd>set list! list?<cr>', {})
