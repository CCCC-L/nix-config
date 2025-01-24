return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,

  config = function()
    require("catppuccin").setup({
    flavour = "latte",
      -- 背景透明
      transparent_background = true,
      term_colors = true,
    })

    -- 改变光标颜色，防止在白色主题下看不见
    vim.opt.guicursor = "n-v-c:Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50"

    vim.cmd([[colorscheme catppuccin]])
  end,
}
