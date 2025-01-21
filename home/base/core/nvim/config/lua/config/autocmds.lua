local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- 当使用Windons Termial时退Nvim时将光标改回竖线
if os.getenv('TERM'):match("xterm") then
  autocmd("VimLeave", {
    callback = function()
      vim.opt.guicursor = ""
      vim.fn.chansend(vim.v.stderr, "\x1b[ q")
    end
  })
end

-- 高亮一下所复制的文本
autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})

-- 自动创建目录
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

