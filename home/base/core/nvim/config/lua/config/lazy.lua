--y 加载Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://mirror.ghproxy.com/https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- 配置Lazy.nvim
require("lazy").setup({
  spec = { { import = "plugins" }, },
  -- defaults = { lazy = true, version = false },  -- 始终使用最新的 commit
  checker = { enabled = true },  -- 自动更新插件
  git = { url_format = "https://mirror.ghproxy.com/https://github.com/%s.git"}, 
  change_detection = {
    enabled = false,
    notify = false,
  },
  install = { colorscheme = { "catppuccin" } },
  performance = {
    rtp = {
      -- 禁用一些默认的插件
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      }
    }
  }
})


