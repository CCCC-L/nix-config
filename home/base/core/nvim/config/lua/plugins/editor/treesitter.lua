return {
  "nvim-treesitter/nvim-treesitter",
  
  event = { "VeryLazy" },
  lazy = vim.fn.argc(-1) == 0,
  init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,

  opts = {
    highlight = { enable = true },
    indent = { enable = true },

    incremental_selection = {
      enable = true,
      keymaps = {
        node_incremental = "v",
        node_decremental = "V",
      },
    },

    -- 折叠
    vim = {
      wo = {
        foldmethod = "expr",
        foldexpr = "nvim_treesitter#foldexpr()",
        foldenable = false,
      }
    },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
