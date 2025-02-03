return {
  "folke/snacks.nvim",
  lazy = false,
  keys = {
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Find Buffers Line",
    },
    {
      "<leader>fy",
      function()
        Snacks.picker.grep()
      end,
      desc = "Find Word",
    },
    {
      "<leader>fY",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Find selection or word",
      mode = { "n", "x" },
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "Find Symbols",
    },
    {
      "<leader>fn",
      function()
        Snacks.picker.files({ args = { "--type", "lua" }, title = "Find Class" })
      end,
      desc = "Find Class",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.commands()
      end,
      desc = "Find Class",
    },
    {
      "<leader>fv",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },

    {
      "<leader>vw",
      function()
        Snacks.lazygit.open()
      end,
      desc = "Open LazyGit",
    },
    {
      "<leader>vb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>vh",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Git Stash",
    },
    {
      "<leader>vs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Find Git Status",
    },
    {
      "<leader>vl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>vf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "File Git Log",
    },
    {
      "<leader>vc",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Line Git Log",
    },
  },
  opts = {
    animate = {
      easing = "inQuad",
      duration = { total = 100 },
    },
    indent = {
      indent = {
        priority = 1,
        enabled = true, -- enable indent guides
        char = "│",
        only_scope = false, -- only show indent guides of the scope
        only_current = false, -- only show indent guides in the current window
      },
      animate = {
        easing = "inQuad",
        duration = { total = 100 },
      },
    },
    scroll = {
      animate = {
        duration = { step = 15, total = 250 },
        easing = "linear",
      },
      animate_repeat = {
        delay = 100, -- delay in ms before using the repeat animation
        duration = { step = 5, total = 50 },
        easing = "linear",
      },
      filter = function(buf)
        return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= "terminal"
      end,
    },
    picker = {
      layout = {
        cycle = true,
        preset = function()
          return vim.o.columns >= 120 and "default" or "sm"
        end,
      },
      layouts = {
        sm = {
          layout = {
            fullscreen = true,
            box = "vertical",
            {
              box = "vertical",
              height = 0.3,
              title = "{title} {live} {flags}",
              title_pos = "center",
              border = "rounded",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            {
              win = "preview",
              title = "{preview}",
              title_pos = "center",
              height = 0.7,
              border = "rounded",
            },
          },
        },
      },
      win = {
        input = {
          keys = {
            ["<c-n>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-p>"] = { "preview_scroll_up", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<c-n>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-p>"] = { "preview_scroll_up", mode = { "i", "n" } },
          },
        },
      },
    },
    dashboard = {
      preset = {
        header = [[
_                _            
\-,-----.        \-,-----.    
|  .--./         |  .--./    
/_) (`-')        /_) (`-')    
||  |OO )        ||  |OO )    
(_'  '--'\,-.    (_'  '--'\,-. 
`-----''-'       `-----''-' 

        ]],
      },
    },
  },
}
