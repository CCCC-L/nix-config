return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  event = "InsertEnter",
  version = "*",
  opts = {
    keymap = {
      preset = "enter",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "scroll_documentation_up", "fallback" },
      ["<C-n>"] = { "scroll_documentation_down", "fallback" },
      cmdline = {
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "scroll_documentation_up", "fallback" },
        ["<C-n>"] = { "scroll_documentation_down", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<Space>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            end
          end,
          "fallback",
        },
      },
    },
    completion = {
      keyword = { range = "full" },
      trigger = {
        show_on_trigger_character = true,
      },
      -- 自动添加括号
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      list = {
        selection = {
          preselect = function(ctx)
            return ctx.mode ~= "cmdline" and not require("blink.cmp").snippet_active({ direction = 1 })
          end,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        update_delay_ms = 0,
      },
    },
    sources = {
      -- default = function(ctx)
      --   local node = vim.treesitter.get_node()
      --   print(node)
      --   if node and vim.tbl_contains({ "parameters", "string_content" }, node:type()) then
      --     return { "lsp" }
      --   else
      --     return { "lsp", "snippets", "buffer" }
      --   end
      -- end,
      -- cmdline = { "path" },
    },
    signature = { enabled = true },
  },
}
