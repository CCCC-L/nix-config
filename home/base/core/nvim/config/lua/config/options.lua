-- 设置leader 键为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- 其他
opt.autowrite = true -- 启动自动保存
opt.backup = false -- 禁用自动缓存
opt.mouse = "" -- 禁用鼠标
opt.confirm = true -- 退出时提示是否保存
opt.grepformat = "%f:%l:%c:%m" -- 更好的grep 格式化
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" } -- 再次打开时恢复之前的编辑状态
opt.shortmess:append({ W = true, I = true, c = true }) -- 忽略一些特定的消息
opt.undofile = true -- 持久化撤销
opt.undolevels = 10000 -- 撤销的最大次数

-- UI
opt.cursorline = true -- 当前光标所在行高亮
opt.laststatus = 3 -- 关闭状态栏
opt.number = true -- 显示行号
opt.relativenumber = true -- 相对行号
opt.pumblend = 0 -- 弹出菜单的透明度
opt.pumheight = 10 -- 弹出菜单最多显示十个选项
opt.scrolloff = 4 -- 上下两边保持四行代码显示
opt.sidescrolloff = 8 -- 左右两边保持八列的代码显示
opt.showmode = false -- 不显示当前的模式
opt.signcolumn = "yes" -- 总是显示错误与警告行
opt.splitbelow = true -- 默认横向分割窗口在下边
opt.splitright = true -- 默认竖向分割窗口在右边
opt.winminwidth = 5 -- 窗口的最小宽度
opt.wrap = false -- 禁用自动换行
opt.breakindent = true -- 断行缩进
opt.linebreak = true -- 防止换行时单词从中间断开
opt.termguicolors = true -- 启动真色彩支持
opt.splitkeep = "screen" --保存当前屏幕所在位置

-- Edit
local indent = 2
opt.tabstop = indent -- 一个Tab等于两个空格
opt.softtabstop = indent -- 一个Tab插入两个空格
opt.autoindent = true -- 启动自动缩进
opt.shiftwidth = indent -- 缩进两个空格
opt.expandtab = true -- 使用空格代替Tab
opt.shiftround = true -- 缩进会四舍五入到最接近的 shiftwidth 值
opt.smartindent = true -- 自动控制缩进
opt.wildmode = "longest:full,full" -- 先补全匹配部分再列出补全项

-- Search
opt.incsearch = true -- 实时搜索
opt.hlsearch = false -- 当执行其他操作时取消高亮
opt.ignorecase = true -- 不区分大小写
opt.smartcase = true -- 当搜索的文字中包含大写时则区分大小写

-- 当使用SSH时将内容复制到系统剪贴板中
-- 粘贴使用Ctrl+v
if os.getenv("SSH_CONNECTION") ~= nil then
	local function paste()
		return {
			vim.fn.split(vim.fn.getreg(""), "\n"),
			vim.fn.getregtype(""),
		}
	end
	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			["+"] = paste,
			["*"] = paste,
		},
	}
end
