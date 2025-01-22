## 查看当前光标下的高亮组
需要C语言的编译环境，如果没有可以使用以下命令临时安装
```bash
nix-shell -p gcc gnumake binutils
```
Vim安装`nvim-treesitter`
```lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- 基础配置
      require("nvim-treesitter.configs").setup({
        -- 安装的高亮支持来源
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          -- 添加你需要的语言
          "python",
          "javascript",
          "typescript",
        },
        
        -- 启用代码高亮
        highlight = {
          enable = true,
        },

        -- 启用增量选择
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
          },
        },
      })

      -- 开启 Folding
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
      vim.wo.foldenable = false
    end,
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
    dependencies = "nvim-treesitter/nvim-treesitter",
  }
}
```
之后输入
```bash
# 安装 lua 的语言解释器
:TSInstall lua
# 打开 Treesitter playground
:TSPlaygroundToggle
# 显示光标下的高亮组
:TSHighlightCapturesUnderCursor
```