return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "light",
    color_overrides = {
      vscLineNumber = "#6E8BB6",
      vscLightBlue = "#19278C",
      vscOrange = "#AE3131",
    },
    group_overrides = {
      -- 基本语法高亮组
      ["@keyword"] = { fg = "#AF00DB" },
      ["@variable.member"] = { fg = "#33869F" },
      ["@punctuation.bracket"] = {fg = "#459E45"},
    },
  },
  init = function()
    vim.cmd.colorscheme("vscode")
  end,
}

