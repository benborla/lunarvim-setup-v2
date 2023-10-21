-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
vim.opt.showtabline = 2 -- always show tabs
vim.opt.showmode = true
vim.opt.spell = true
lvim.debug = false
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.smooth_scroll = "cinnamon"
lvim.builtin.telescope.pickers.find_files.previewer = nil
lvim.builtin.telescope.pickers.live_grep = nil
lvim.builtin.telescope.pickers.buffers = nil
lvim.builtin.illuminate.active = true
lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "node_modules", "build", "yarn.lock", "composer.lock", "vendor"
}
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

-- Lunarvim space toggle delay
vim.opt.timeoutlen = 150

-- disable project plugin
lvim.builtin.project.active = true

-- enable/disable NerdTree Plugin
lvim.builtin.nvimtree.active = true

lvim.colorscheme = "gruvbox"
vim.o.background = "dark"
-- vim.g.tokyonight_style = "night"

-- BUFFERLINE CONFIG
-- lvim.builtin.bufferline.options.mode = "tabs"
-- lvim.builtin.lualine.options.theme = 'tokyonight'

lvim.builtin.bufferline.active = true
require("user.lualine").config()
require('user.bufferline_2').config()
-- require("user.dashboard").config()


-- to disable icons and use a minimalist setup, uncomment the following
lvim.use_icons = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-tab>"] = ":BufferLineCyclePrev<CR>"
-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

lvim.builtin.telescope.defaults.initial_mode = "normal"
-- lvim.builtin.telescope.defaults.layout_config.horizontal.mirror = false
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120
lvim.builtin.telescope.defaults.layout_config.prompt_position = "bottom"
-- lvim.builtin.telescope.defaults.layout_config.vertical.mirror = false
lvim.builtin.telescope.defaults.layout_config.width = 0.75
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"

-- TELESCOPE PREVIEW DISPLAY fix
lvim.builtin.telescope.defaults.layout_strategy = "flex"
lvim.builtin.telescope.defaults.layout_config = {
  height = 0.8,
  width = 0.8,
  horizontal = {
    preview_cutoff = 120,
    preview_width = 0.6,
  },
  vertical = {
    preview_cutoff = 40,
  },
  flex = {
    flip_columns = 150,
  },
}

for key, _ in pairs(lvim.builtin.telescope.pickers) do
  lvim.builtin.telescope.pickers[key].previewer = nil
  lvim.builtin.telescope.pickers[key].theme = nil
end

lvim.builtin.telescope.pickers.vim_options = { layout_config = { height = 0.66, width = 0.66 } }

lvim.builtin.telescope.pickers.colorscheme = { layout_strategy = "cursor", layout_config = { width = 0.19 } }
-- end TELESCOPE PREVIEW DISPLAY fix
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "php"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.line_wrap_cursor_movement = true
-- generic LSP settings

-- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- CUSTOM CONFIG -- BENBORLA --
require('options')
require('maps')
require('plugins')

-- LUALINE CONFIG
-- Color table for highlights
-- stylua: ignore

local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

-- local conditions = {
--   buffer_not_empty = function()
--     return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
--   end,
--   hide_in_width = function()
--     return vim.fn.winwidth(0) > 80
--   end,
--   check_git_workspace = function()
--     local filepath = vim.fn.expand('%:p:h')
--     local gitdir = vim.fn.finddir('.git', filepath .. ';')
--     return gitdir and #gitdir > 0 and #gitdir < #filepath
--   end,
-- }

-- Config

-- local config = {
--   options = {
--     -- Disable sections and component separators
--     component_separators = { left = '', right = '' },
--     section_separators = { left = '', right = '' },
--     theme = 'tokyonight',
--     icons_enabled = true
--   },
--   sections = {
--     -- these are to remove the defaults
--     lualine_a = { 'mode' },
--     lualine_b = { 'filesize' },
--     lualine_y = { { 'progress', color = { fg = colors.fg, gui = 'bold' } }, 'location' },
--     lualine_z = {
--       {
--         'branch',
--         icon = '',
--         color = { fg = colors.green, gui = 'bold', bg = colors.darkblue },
--       },
--       {
--         'diff',
--         -- Is it me or the symbol for modified us really weird
--         symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
--         diff_color = {
--           added = { fg = colors.green, bg = colors.darkblue },
--           modified = { fg = colors.orange, bg = colors.darkblue },
--           removed = { fg = colors.red, colors.darkblue },
--         },
--         cond = conditions.hide_in_width,
--       }
--     },
--     -- These will be filled later
--     lualine_c = {
--       {
--         'filetype',
--         fmt = string.lower,
--         icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
--         color = { fg = colors.yellow, gui = 'italic' },
--       },
--       {
--         'fileformat',
--         fmt = string.upper,
--         icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
--         color = { fg = colors.green, gui = 'italic', bg = colors.darkblue },
--       },
--       {
--         'filename',
--         cond = conditions.buffer_not_empty,
--         color = { fg = colors.magenta, gui = 'bold' }, 
--         file_status = true, -- display file status
--         path = 1            -- filename
--       }
--     },
--     lualine_x = {
--       {
--         'diagnostics',
--         sources = { 'nvim_diagnostic' },
--         symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
--         diagnostics_color = {
--           color_error = { fg = colors.red },
--           color_warn = { fg = colors.yellow },
--           color_info = { fg = colors.cyan },
--         },
--       }
--     }
--   },
--   inactive_sections = {
--     -- these are to remove the defaults
--     lualine_a = {},
--     lualine_b = {},
--     lualine_y = {},
--     lualine_z = {},
--     lualine_c = {},
--     lualine_x = {},
--   },
-- }

-- Now don't forget to initialize lualine
-- lvim.builtin.lualine.options = config.options
-- lvim.builtin.lualine.sections = config.sections
-- END LUALINE CONFIG

