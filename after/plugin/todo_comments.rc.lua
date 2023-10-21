local status, todo = pcall(require, 'todo-comments')
if (not status) then return end

local icons = require("user.lsp_kind").todo_comments
todo.setup {
  keywords = {
    FIX = { icon = icons.FIX },
    TODO = { icon = icons.TODO, alt = { "WIP" } },
    HACK = { icon = icons.HACK, color = "hack" },
    WARN = { icon = icons.WARN },
    PERF = { icon = icons.PERF },
    NOTE = { icon = icons.NOTE, alt = { "INFO", "NB" } },
    ERROR = { icon = icons.ERROR, color = "error", alt = { "ERR" } },
    REFS = { icon = icons.REFS },
    SAFETY = { icon = icons.SHIELD, color = "hint" },
  },
  highlight = { max_line_len = 120 },
  colors = {
    error = { "DiagnosticError" },
    warning = { "DiagnosticWarn" },
    info = { "DiagnosticInfo" },
    hint = { "DiagnosticHint" },
    hack = { "Function" },
    ref = { "FloatBorder" },
    default = { "Identifier" },
  },
}
