local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

function telescope_set_cwd()
  cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    -- if not git then active lsp client root
    -- will get the configured root directory of the first attached lsp. You will have problems if you are using multiple lsps
    cwd = vim.lsp.get_active_clients()[1].config.root_dir
  end

  return cwd
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup({
  defaults = {
    layout_strategy = "horizontal",
    path_display = { truncate = 2 },
    mappings = {
      n = {
        ['q'] = actions.close
      }
    },
    file_ignore_patterns = {
      "node_modules", "build", "yarn.lock", "composer.lock", "vendor", "package-lock.json"
    }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw add use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['l'] = fb_actions.change_cwd,
          ['/'] = function() vim.cmd('startinsert') end
        }
      }
    }
  }
})

telescope.load_extension('file_browser')
local opts = { noremap = true, silent = true }

-- @key-map press ctrl + p to find file
-- vim.keymap.set('n', '<C-p>', "<cmd>lua require('telescope.builtin').find_files({ no_ignore = false, hidden = true})<cr>", opts)
vim.keymap.set('n', '<C-p>',
  "<cmd>lua require('telescope.builtin').find_files({ respect_git_ignore = false, no_ignore = false, hidden = true, path = '%:p:h', cwd = telescope_set_cwd() })<CR>"
  , opts)
vim.keymap.set('n', ';v', "<cmd>lua require('telescope.builtin').search_history({ no_ignore = false, hidden = true})<CR>"
, opts)

-- @key-map press ;r find file that contains the regex
vim.keymap.set('n', ';r',
  "<cmd>lua require('telescope.builtin').live_grep({ path = '%:p:h', cwd = telescope_set_cwd() })<CR>", opts)
-- @key-map press \\ find file in the buffer
vim.keymap.set('n', '\\\\', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)

-- @key-map press ;t for help tags
vim.keymap.set('n', ';t', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
-- @key-map press ;; for resume function
vim.keymap.set('n', ';;', "<cmd>lua require('telescope.builtin').resume()<CR>", opts)
-- @key-map press ;; for resume to previous action
vim.keymap.set('n', ';e', "<cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)
-- @key-map press ;f to open file explorer

-- always search on the project dir
vim.keymap.set('n', ';f',
  "<cmd>lua require('telescope').extensions.file_browser.file_browser({ path = '%:p:h', cwd = telescope_buffer_dir(), no_ignore = false, respect_git_ignore = false, hidden = true, grouped = true, previewer = true, initial_mode = 'normal', layout_strategy = 'flex', layout_config = { height = 0.8, width = 0.8, horizontal = { preview_cutoff = 100, preview_width = 0.5, prompt_position = 'top' }, vertical = { preview_cutoff = 40, }, flex = { flip_columns = 150, }} })<CR>"
  , opts)

-- additional shortcuts
-- @key-map when in file explorer: press ctrl + t to open a file in a new tab, press ctrl + x to open file in horizontal split, ctrl + v to vertical split
-- @key-map shift + n to create a new file
