return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
    { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
    { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "go to file" },
    { "<leader>fl", "<cmd>FzfLua lines<CR>", desc = "open buffers lines" },
    { "<leader>fy", "<cmd>FzfLua live_grep_native<CR>", desc = "Search word" },
    { "<leader>fu", "<cmd>FzfLua grep_cword<CR>", desc = "Search word under cursor" },
    { "<leader>fgf", "<cmd>FzfLua git_files<CR>", desc = "Search git ls-files" },
    { "<leader>fgs", "<cmd>FzfLua git_status<CR>", desc = "Search git status" },
    { "<leader>fgc", "<cmd>FzfLua git_commits<CR>", desc = "Search project git commit" },
    { "<leader>fgu", "<cmd>FzfLua git_bcommits<CR>", desc = "Search file git commit" },
    { "<leader>fgb", "<cmd>FzfLua git_branches<CR>", desc = "Search git branche" },
    { "<leader>fgh", "<cmd>FzfLua git_stash<CR>", desc = "Search git stash" },
    { "<leader>fr", "<cmd>FzfLua registers<CR>", desc = "Search registers" },
    { "<leader>fk", "<cmd>FzfLua keymaps<CR>", desc = "Search keymaps" },
  },
}
