lvim.plugins = {
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "phaazon/hop.nvim" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120,              -- Width of the floating window
        height = 25,              -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false,            -- Print debug information
        opacity = nil,            -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil      -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
  -- {
  --   "echasnovski/mini.map",
  --   branch = "stable",
  --   config = function()
  --     require('mini.map').setup()
  --     local map = require('mini.map')
  --     map.setup({
  --       integrations = {
  --         map.gen_integration.builtin_search(),
  --         map.gen_integration.diagnostic({
  --           error = 'DiagnosticFloatingError',
  --           warn  = 'DiagnosticFloatingWarn',
  --           info  = 'DiagnosticFloatingInfo',
  --           hint  = 'DiagnosticFloatingHint',
  --         }),
  --       },
  --       symbols = {
  --         encode = map.gen_encode_symbols.dot('4x2'),
  --       },
  --       window = {
  --         side = 'right',
  --         width = 20, -- set to 1 for a pure scrollbar :)
  --         winblend = 15,
  --         show_integration_count = false,
  --       },
  --     })
  --   end
  -- },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true,    -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "jwalton512/vim-blade"
  },
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  {
    "kdheepak/tabline.nvim"
  },
  {
    "folke/neodev.nvim"
  },
  {
    "folke/tokyonight.nvim"
  },
  { "ap/vim-css-color" },
  { "lunarvim/lunar.nvim" },
  {
    "0x100101/lab.nvim",
    dependencies = { { 'nvim-lua/plenary.nvim', opt = true } },
    build = 'cd js && npm ci'
  },
  { "folke/trouble.nvim" },
  { "sidebar-nvim/sidebar.nvim" },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    'barrett-ruth/import-cost.nvim',
    build = 'sh install.sh npm',
    -- if on windows
    -- build = 'pwsh install.ps1 yarn',
    config = true
  },
  -- Add terraform
  -- {
  --   "hashivim/vim-terraform"
  -- },
  -- { "ellisonleao/gruvbox.nvim", priority = 1000 },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
  {
    "kensyo/nvim-scrlbkun"
  },
  {
    "HiPhish/rainbow-delimiters.nvim"
  },
  {
    "rrethy/vim-hexokinase",
    build = 'make hexokinase'
  },
  {
    'kkoomen/vim-doge'
  },
  {
    'github/copilot.vim'
  },
  {
    'nelsyeung/twig.vim'
  },
  -- {
  --   'dart-lang/dart-vim-plugin'
  -- },
  -- {
  --   'natebosch/dartlang-snippets'
  -- },
  -- {
  --   'akinsho/flutter-tools.nvim',
  --   lazy = false,
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'stevearc/dressing.nvim', -- optional for vim.ui.select
  --   },
  --   config = true,
  -- },
  {
    'marko-cerovac/material.nvim'
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      show_help = "yes",         -- Show help text for CopilotChatInPlace, default: yes
      debug = false,             -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
      language =
      "English"                  -- Copilot answer language settings when using default prompts. Default language is English.
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
      -- temperature = 0.1,
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>cpb", "<cmd>CopilotChatBuffer<cr>",  desc = "CopilotChat - Chat with current buffer" },
      { "<leader>cpe", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cpt", "<cmd>CopilotChatTests<cr>",   desc = "CopilotChat - Generate tests" },
      {
        "<leader>cpT",
        "<cmd>CopilotChatVsplitToggle<cr>",
        desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
      },
      {
        "<leader>cpv",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>cpx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
      {
        "<leader>cpf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
      {
        "<leader>cpr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      },
      {
        "<leader>cpi",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      }
    },
  },
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  -- Vitest
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest") {
            -- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
            filter_dir = function(name, rel_path, root)
              return name ~= "node_modules"
            end,
          },
        }
      })
    end,
  },
  -- Tailwind Tool
  {
    "luckasRanarison/tailwind-tools.nvim",
  },
  {
    "MaximilianLloyd/tw-values.nvim",
    keys = {
      { "<leader>sv", "<cmd>TWValues<cr>", desc = "Show tailwind CSS values" },
    },
    opts = {
      border = "rounded",            -- Valid window border style,
      show_unknown_classes = true,   -- Shows the unknown classes popup
      focus_preview = true,          -- Sets the preview as the current window
      copy_register = "",            -- The register to copy values to,
      keymaps = {
        copy = "<C-y>"               -- Normal mode keymap to copy the CSS values between {}
      }
    }
  },
}
