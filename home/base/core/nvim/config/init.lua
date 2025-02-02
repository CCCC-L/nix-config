require("config.options")
require("config.lazy")

vim.g.config_utils = {
  opts_ensure_installed = function(opts, new_item)
    opts = opts or {}
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, new_item)
    else
      opts.ensure_installed = new_item
    end
  end,
}

-- 懒加载keymap和autocmds
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.autocmds")
    require("config.keymaps")

    -- 在options设置会被ftplugin 插件中的设置替换掉
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})
