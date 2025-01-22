return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    -- 安装的高亮支持来源
    ensure_installed = {
      "lua",
      "nix",
      "bash",
    },

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
  }
}
