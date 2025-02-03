return {
  "lewis6991/gitsigns.nvim",
  event = "LazyFile",
  keys = {
    {
      "<leader>vz",
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "Reset Hunk",
    },
    {
      "<leader>vz",
      function()
        require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end,
      mode = { "v" },
      desc = "Reset Hunk",
    },
    {
      "<leader>vZ",
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "Reset Buffer",
    },
    {
      "<leader>vc",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Preview Hunk",
    },
    {
      "<leader>vi",
      function()
        require("gitsigns").blame_line({ full = true })
      end,
      desc = "Show now line commit message",
    },
    {
      "<leader>vd",
      function()
        require("gitsigns").diffthis()
      end,
      desc = "Diff stage",
    },
    {
      "<leader>vD",
      function()
        require("gitsigns").diffthis("~")
      end,
      desc = "Diff last commit",
    },
    {
      "<leader>va",
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      desc = "Show blame",
    },
    {
      "<leader>vn",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "<leader>vj", bang = true })
        else
          require("gitsigns").nav_hunk("next")
        end
      end,
      desc = "Next change",
    },
    {
      "<leader>ve",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "<leader>vk", bang = true })
        else
          require("gitsigns").nav_hunk("prev")
        end
      end,
      desc = "Prev change",
    },
  },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    current_line_blame_opts = {
      delay = 200,
    },
  },
}
