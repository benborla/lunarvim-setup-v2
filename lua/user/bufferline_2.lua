local M = {}
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  white    = '#ffffff',
  gray     = '#c0c0c0',
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

M.config = function()
  lvim.builtin.bufferline.options = {
    mode = 'tabs',
    -- themable = 'true',
    -- indicator = {
    --   icon = '▎', -- this should be omitted if indicator style is not 'icon'
    --   style = 'underline',
    -- },
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    left_mouse_command = "buffer %d",
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icons = true,
    colors_icons = true,
    diagnostics = 'nvim_lsp',
    -- disable tab indicator
    show_buffer_icons = true,
    show_tab_indicators = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and '⛔️ '
            or (e == "warning" and "⚠️ " or 'ℹ ')
        s = s .. sym .. n
      end
      return s
    end,
    -- end disable tag indicator
    -- enable/disable tab number/order
    numbers = "ordinal",
    enforce_regular_tabs = true,
    offset = {
      text_align = 'left'
    },
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' }
    },
    show_duplicate_prefix = true -- whether to show duplicate buffer prefix
  }

  lvim.builtin.bufferline.highlights = {
    separator = {
      fg = colors.magenta,
      bg = colors.bg
    },
    separator_selected = {
      bg = colors.cyan
    },
    background = {
      bg = colors.bg
    },
    numbers = {
      fg = colors.fg,
      bg = colors.bg
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bg = colors.bg,
      bold = true
    },
    buffer = {
      fg = colors.fg
    },
    tab = {
      fg = colors.gray,
      bg = colors.bg
    },
    tab_selected = {
      fg = colors.white,
      bg = colors.magenta
    },
    -- the long blank line
    fill = {
      bg = colors.bg
    },
    numbers_selected = {
      fg = colors.magenta,
      bg = colors.bg
    },
    diagnostic = {
      fg = colors.magenta,
      bg = colors.bg
    },
    diagnostic_visible = {
      fg = colors.magenta,
      bg = colors.bg
    },
    diagnostic_selected = {
      fg = colors.magenta,
      bg = colors.bg
    },
    hint = {
      fg = colors.magenta,
      bg = colors.bg
    },
    hint_visible = {
      fg = colors.magenta,
      bg = colors.bg
    },
    hint_selected = {
      fg = colors.magenta,
      bg = colors.bg
    },
    hint_diagnostic = {
      fg = colors.magenta,
      bg = colors.bg
    },
    hint_diagnostic_visible = {
      fg = colors.magenta,
      bg = colors.bg
    },
    hint_diagnostic_selected = {
      fg = colors.magenta,
      bg = colors.bg
    },
    info = {
      fg = colors.cyan,
      bg = colors.bg
    },
    info_visible = {
      fg = colors.cyan,
      bg = colors.bg
    },
    info_selected = {
      fg = colors.cyan,
      bg = colors.bg
    },
    info_diagnostic = {
      fg = colors.cyan,
      bg = colors.bg
    },
    info_diagnostic_visible = {
      fg = colors.cyan,
      bg = colors.bg
    },
    info_diagnostic_selected = {
      fg = colors.cyan,
      bg = colors.bg
    },
    warning = {
      fg = colors.yellow,
      bg = colors.bg
    },
    warning_visible = {
      fg = colors.yellow,
      bg = colors.bg
    },
    warning_selected = {
      fg = colors.yellow,
      bg = colors.bg
    },
    warning_diagnostic = {
      fg = colors.yellow,
      bg = colors.bg
    },
    warning_diagnostic_visible = {
      fg = colors.yellow,
      bg = colors.bg
    },
    warning_diagnostic_selected = {
      fg = colors.yellow,
      bg = colors.bg
    },
    error = {
      fg = colors.red,
      bg = colors.bg
    },
    error_visible = {
      fg = colors.red,
      bg = colors.bg
    },
    error_selected = {
      fg = colors.red,
      bg = colors.bg
    },
    error_diagnostic = {
      fg = colors.red,
      bg = colors.bg
    },
    error_diagnostic_visible = {
      fg = colors.red,
      bg = colors.bg,
    },
    error_diagnostic_selected = {
      fg = colors.red,
      bg = colors.bg,
      bold = true,
      italic = false,
    },
    modified = {
      fg = colors.blue,
      bg = colors.bg,
    },
    modified_visible = {
      fg = colors.blue,
      bg = colors.bg
    },
    modified_selected = {
      fg = colors.blue,
      bg = colors.bg
    },

  }
end

return M
