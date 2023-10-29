vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.cmd "set noshowcmd"
vim.cmd "set noshowmode"

vim.cmd "hi BufferLineFill guibg=#000000"

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true

vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.showmatch = true
vim.opt.cmdheight = 0

vim.opt.scrolloff = 10
vim.opt.shell = '/bin/zsh'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'

vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.wrap = true -- no wrap lines
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd('autocmd VimEnter * highlight DiagnosticUnderlineError gui=undercurl')

-- Turn off paste mode when leaving insert moee
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisk in block comments
vim.opt.formatoptions:append { 'r' }

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.background = 'dark'
vim.opt.cursorline = true
vim.opt.colorcolumn = '80,120'
-- @INFO: Pop-up menu transparency, 0 for opaque
vim.opt.pumblend=2

vim.cmd('autocmd VimEnter * highlight LineNr guifg=#c0c0c0')
vim.cmd('autocmd VimEnter * highlight CursorLine term=bold cterm=bold guibg=#2f4f4f')
vim.cmd('autocmd VimEnter * highlight ColorColumn ctermbg=lightgrey guibg=#9d0006')
vim.cmd('autocmd VimEnter * highlight ColorColumn ctermbg=red guibg=#af3a03')
vim.cmd('autocmd VimEnter * highlight Visual guifg=black guibg=#8f3f71 guifg=none')
-- vim.cmd('autocmd VimEnter * highlight Comment guifg=#665c54')
vim.cmd('autocmd VimEnter * highlight Normal guibg=#0e0b1e')

-- vim.cmd('autocmd VimEnter * highlight BufferLineFill guibg=#12131d')
-- vim.cmd('autocmd VimEnter * highlight BufferLineDevIconTs guibg=#12131d')
-- vim.cmd('autocmd VimEnter * highlight BufferLineDevIconJs guibg=#12131d')
-- vim.cmd('autocmd VimEnter * highlight BufferLineDevIconPhp guibg=#12131d')
-- vim.cmd('autocmd VimEnter * highlight BufferLineDevIconTsSelected guibg=#12131d')
-- vim.cmd('autocmd VimEnter * highlight BufferLineBackground guibg=#12131d')
-- vim.cmd('autocmd VimEnter * highlight BufferLineSeparator guibg=#12131d')
-- vim.cmd('autocmd VimEnter * highlight BufferLineDevIconPackageJson guibg=#12131d')
-- vim.cmd('autocmd VimEnter * highlight BufferLineTabSelected guibg=#222436')
-- vim.cmd('autocmd VimEnter * highlight BufferLineTab guifg=#c0c0c0')

-- Startify 
-- vim.cmd("set viminfo='100,n$HOME/.vim/files/info/viminfo")

vim.opt.clipboard:append { 'unnamedplus' }

-- Show space as character
vim.opt.list = false
-- vim.cmd('autocmd VimEnter * set list')
-- vim.cmd('autocmd VimEnter * set lcs+=space:·')
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.api.nvim_set_keymap('', ';l', '<cmd>set list! list?<cr>', {})

--
-- SET BACKGROUND TO TRANSPARENT
--
vim.cmd('autocmd VimEnter * highlight Normal guibg=NONE ctermbg=NONE')
vim.cmd('autocmd VimEnter * highlight EndOfBuffer guibg=NONE ctermbg=NONE')
vim.cmd('autocmd VimEnter * highlight DiagnosticUnderlineError gui=undercurl')
