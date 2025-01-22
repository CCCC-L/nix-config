return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    vim.g.VM_theme = "purplegray"
    vim.g.VM_maps = {
      -- alt+b 查找当前光标下的单词
      ["Find Under"] = "<M-b>",
      ["Find Subword Under"] = "<M-b>",
      ["Add Cursor Down"] = "<M-j>",
      ["Add Cursor Up"] = "<M-k>",
      -- 选择所有相同项目
      ["Visual All"] = "\\A",
      -- 切换到视觉模式
      ["Switch Mode"] = "v",
      -- 跳过当前选择
      ["Skip Region"] = "q",
      -- 移除当前选择
      ["Remove Region"] = "Q",
      -- 前往上一个或下一个选择
      ["Goto Next"] = "}",
      ["Goto Prev"] = "{",
      -- 对选中的内容进入大小写转换
      -- u：将选定文本转换为小写（lowercase）。
      -- U：将选定文本转换为大写（UPPERCASE）。
      -- C：将选定文本的每个单词的首字母转换为大写（Capitalize）。
      -- t：将选定文本的首字母转换为小写（toggle case），即如果是大写就变为小写，反之亦然。
      -- c：将选定文本的每个单词的首字母转换为大写（Capitalize），与 C 相同，但通常用于不同的上下文。
      -- P：将选定文本的每个单词的首字母转换为大写（Proper Case），即首字母大写，其余字母小写。
      -- s：将选定文本的每个单词的首字母转换为小写（lowercase），其余字母保持不变。
      -- S：将选定文本的每个单词的首字母转换为大写（UPPERCASE），其余字母保持不变。
      -- -：反转选定文本的大小写（swap case），即大写变小写，小写变大写。
      -- .：重复上一次的大小写转换操作。
      ["Case Conversion Menu"] = "C",
      -- 将选中的单词对齐
      ["Align"] = "\\a",
    }
  end,
}
