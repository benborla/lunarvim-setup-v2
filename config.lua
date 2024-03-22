-- general
lvim.log.level = "warning"
lvim.format_on_save.enabled = false
vim.opt.showtabline = 2 -- always show tabs
vim.opt.showmode = true
vim.opt.spell = false
lvim.debug = false
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.smooth_scroll = "cinnamon"
lvim.builtin.telescope.pickers.find_files.previewer = nil
lvim.builtin.telescope.pickers.live_grep = nil
lvim.builtin.telescope.pickers.buffers = nil
lvim.builtin.illuminate.active = true
-- Indent Blankline
lvim.builtin.indentlines.active = true
lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "node_modules", "build", "yarn.lock", "composer.lock", "vendor"
}
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
lvim.transparent_window = true

-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- Lunarvim space toggle delay
vim.opt.timeoutlen = 150

-- disable project plugin
lvim.builtin.project.active = true

-- enable/disable NerdTree Plugin
lvim.builtin.nvimtree.active = true

lvim.colorscheme = "material"
vim.g.material_style = "deep ocean"
vim.o.background = "dark"
-- vim.g.tokyonight_style = "night"

-- BUFFERLINE CONFIG
-- lvim.builtin.bufferline.options.mode = "tabs"
-- lvim.builtin.lualine.options.theme = 'tokyonight'

lvim.builtin.bufferline.active = true
-- Configuration for Status line
require("user.lualine").config()
-- Configuration for Tab line
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
-- @INFO: If you encounter an error `query.lua:259: query: invalid node type at position 1477 for language tsx`, set this to false
lvim.builtin.treesitter.highlight.enable = false
lvim.line_wrap_cursor_movement = true

-- CUSTOM CONFIG -- BENBORLA --
require('options')
require('maps')
require('plugins')
