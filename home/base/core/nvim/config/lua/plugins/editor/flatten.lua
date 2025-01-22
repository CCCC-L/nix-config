-- 在当前NeoVim中打开终端的输出
return {
  "willothy/flatten.nvim",
  lazy = false,
  priority = 1001,
  opts = { 
    window = {
      open = "alternate",
      diff = "tab_vsplit",
      focus = "first",
    },
  },
}
