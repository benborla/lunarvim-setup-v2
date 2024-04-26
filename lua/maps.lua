local keymap = vim.keymap

-- Do not yank with x
-- Remove character using "x" when in normal mode
keymap.set('n', 'x', '"_x')

-- Increment/decrement
-- Increment/decrement a number
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
-- for mac press ^ + a to select all texts
keymap.set('n', '<C-a>', 'gg<S-v>G')
keymap.set('n', 'aa', 'gg<S-v>G')

-- press nww to save changes
keymap.set('n', '<C-s>', '<ESC>:w!<CR>')
keymap.set('i', '<C-s>', '<ESC>:w!<CR>')
keymap.set('n', 'nww', '<ESC>:w!<CR>')
-- press ww to save changes when in visual mode
keymap.set('v', 'ww', '<ESC>:w!<CR>')
-- press ww to save changes when in insert mode
keymap.set('i', 'ww', '<ESC>:w!<CR>')
-- press qq to close file
keymap.set('n', 'qw', '<ESC>:q!<CR>')
keymap.set('n', 'qe', '<ESC>:bw!<CR>')
keymap.set('n', 'Q', '<ESC>:qa!<CR>')
-- press ii to go back to normal mode
keymap.set('i', 'ii', '<ESC>')
keymap.set('i', 'jj', '<ESC>')
keymap.set('v', 'ii', '<ESC>')

keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')

-- press te to open a new tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- SPLIT WINDOW
-- press sg to split current file horizontally
keymap.set('n', 'sg', ':split<Return><C-w>w', { silent = true })
-- press sg to split current file vertically
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- MOVE WINDOW

-- ctrl + w
-- keymap.set('n', '<Space>', '<C-w>')
-- space + <- to move window to the left
keymap.set('', 's<left>', '<C-w>h')

-- space + -> to move window to the right
keymap.set('', 's<right>', '<C-w>l')

-- space + arrow up to move window to the up
keymap.set('', 's<up>', '<C-w>k')

-- space + arrow down to move window to the down
keymap.set('', 's<down>', '<C-w>j')

keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')


-- RESIZE WINDOW
-- press arrow left to resize window from the left
keymap.set('n', '<left>', '<C-w><')
-- press arrow right to resize window from the right
keymap.set('n', '<right>', '<C-w>>')
-- press arrow up to resize window from the up
keymap.set('n', '<up>', '<C-w>+')
-- press arrow down to resize window from the down
keymap.set('n', '<down>', '<C-w>-')
-- @keymap <space> + ff go to definition
-- then press ctrl + o to go back to the selected text prior to going to the defnition
keymap.set('n', '<Space>ff', ':vsplit | lua vim.lsp.buf.definition()<Return>')

keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')
keymap.set('v', 'yy', 'vg_')


-- show current file full path


-- LSP Shortcuts
-- to show the drop down press ctrl + n, to select or highlight you may use either the arrow keys or ctrl + n
-- for LSP docs, to scroll down on docs press ctrl + d, to scroll up press ctrl + f

-- DELETE WITHOUT REPLACING THE CLIPBOARD (OR REGISTERING IN XCLIP)
-- black hole register strategy
keymap.set('n', 'd', '"_d')
keymap.set('n', 'c', '"_c')
keymap.set('n', 'x', '"_x')
-- this will ensure that whenever your delete a text or a character it won't replaced
-- whatever you have in your clipboard.
--
keymap.set('n', 'gpd', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
keymap.set('n', 'gpt', "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>")
keymap.set('n', 'gpi', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
keymap.set('n', 'gP', "<cmd>lua require('goto-preview').close_all_win()<CR>")
keymap.set('n', 'gpr', "<cmd>lua require('goto-preview').goto_preview_references()<CR>")

-- Tab Cycle
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-tab>"] = ":BufferLineCyclePrev<CR>"

-- Trouble plugin
keymap.set('n', ';g', ':TroubleToggle<CR>')

-- Toggle LSP Definition Lists
keymap.set('n', ';ww', ':Telescope lsp_document_symbols<CR>')
keymap.set('n', ';wf', ':Telescope lsp_document_symbols default_text=:method:<CR>')
keymap.set('n', ';wv', ':Telescope lsp_document_symbols default_text=:property:<CR>')
keymap.set('n', ';wo', ':Telescope lsp_document_symbols default_text=:constant:<CR>')
keymap.set('n', ';wc', ':Telescope lsp_document_symbols default_text=:class:<CR>')
keymap.set('n', ';wi', ':Telescope lsp_document_symbols default_text=:interface:<CR>')
keymap.set('n', ';p', '<CMD>Telescope projects<CR>')

-- Generate DocBlock (kkoomen/vim-doge#)
keymap.set('n', ';d', ':DogeGenerate<CR>')

-- press K to show function doc
keymap.set('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>')

-- Copilot
-- ctrl+l to accept suggestion
-- ctrl+[ to go back to previous suggestion
-- ctrl+] to go to next suggestion
vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-[>", 'copilot#Previous()', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-]>", 'copilot#Next()', { silent = true, expr = true })

-- toggle spelling
lvim.keys.normal_mode[";s"] = ":setlocal spell! spelllang=en_us<CR>"

keymap.set('n', 'sdvw', '<cmd>lua require("neotest").run.run({ vitestCommand = "vitest --watch" })<cr>')

keymap.set('n', ';vt', '<cmd>lua require("neotest").summary.toggle()<cr>')

-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>dvw",
--   "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>",
--   { desc = "Run Watch" }
-- )

-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>dvwf",
--    "<cmd>lua require('neotest').run.run({ tonumber(vim.fn.expand("%")), vitestCommand = 'vitest --watch' })<cr>",
--   { desc = "Run Watch File" }
-- )
--
-- Disable mouse scrolling in all modes
vim.api.nvim_set_keymap("n", "<ScrollWheelUp>", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<ScrollWheelDown>", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<ScrollWheelUp>", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<ScrollWheelDown>", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<ScrollWheelUp>", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<ScrollWheelDown>", "<nop>", { noremap = true, silent = true })


-- Vim Tmux bindings
-- vim.api.nvim_set_keymap("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<c-j>", "<cmd>TmuxNavigateRight<cr>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<c-l>", "<cmd>TmuxNavigateDown<cr>", { noremap = true, silent = true })
