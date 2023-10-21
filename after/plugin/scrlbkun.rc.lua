local status, scrlbkun = pcall(require, 'scrlbkun')
if (not status) then return end

scrlbkun.setup({
  single_window = true,
  zindex = 10,
  winblend = 40,
  excluded_filetypes = { "NvimTree" },
  excluded_buftypes = { "prompt" },
  fadeout_time = 2000,
  width = 3,
  bar = {
    enable = true,
    draw_events = { "WinScrolled", "BufEnter", "FocusGained" },
    draw_events_tab = { "VimResized", "TabEnter" },
    priority = 100,
    draw_columns = { 1, 2, 3 },
    sign = " ",

  },

  cursor = {
    -- The same as those of the bar component
    enable = true,
    draw_events = { "BufEnter", "FocusGained", "CursorMoved" },
    draw_events_tab = { "VimResized", "TabEnter" },
    priority = 200,
    draw_columns = { 1, 2, 3 },

    -- Signs for a cursor. Specify in array. If you specify an array of n-elements,
    -- then the sign to be used is determined in n more levels depending on the
    -- cursor position.
    signs = {
      "▔",
      "━",
      "▁",
    },

    -- How to determin the sign to be used. "skip_first" or "normal"
    sign_arrangement = "skip_first"
  },

  -- search component
  search = {
    -- The same as those of the bar component
    enable = true,
    draw_events = {},
    draw_events_tab = {
      "TextChanged",
      "TextChangedI",
      "TextChangedP",
      "TabEnter",
      {
        "CmdlineLeave",
        { "/", "\\?", ":" }
      },
      {
        "CmdlineChanged",
        { "/", "\\?" }
      },
    },
    priority = 500,
    draw_columns = { 1 },

    -- Signs for search results.
    -- If you specify an array of n-elements,
    -- then the sign to be used is determined in n more levels depending
    -- on the number of matched terms
    signs = {
      ".",
      ":",
    },

    -- If set to true, the 'signs' field is ignored and the plugin uses
    -- symbols and an algorithm that allow for just a little more detailed
    -- drawing.
    use_built_in_signs = true,
  },

  -- diagnostics component
  diagnostics = {
    -- The same as those of the bar component
    enable = true,
    draw_events = {},
    draw_events_tab = { "BufEnter", "DiagnosticChanged", "TabEnter" },
    priority = 400,
    draw_columns = { 2 },

    -- Signs for diagnostics.
    signs = {
      -- If you specify an array of n-elements,
      -- then the sign to be used is determined in n more levels depending
      -- on the number of errors {warns, infos, hints}.
      ERROR = { ".", ":" },
      WARN = { ".", ":" },
      INFO = { ".", ":" },
      HINT = { ".", ":" },
    },

    -- The same as that of the search component
    use_built_in_signs = true,
  },

  -- githunks component
  githunks = {
    -- The same as those of the bar component
    enable = true,
    draw_events = {},
    draw_events_tab = {
      {
        "User",
        "GitSignsUpdate"
      }
    },
    priority = 300,
    draw_columns = { 3 },

    -- Signs for githunks.
    signs = {
      -- If you specify an array of n-elements,
      -- then the sign to be used is determined in n more levels depending
      -- on add {delete, change}-hunks length
      add = { "│" },
      delete = { "▸" },
      change = { "│" },
    },

    -- The same as that of the search component
    use_built_in_signs = true,
  }
})
