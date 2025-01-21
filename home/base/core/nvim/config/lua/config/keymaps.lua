vim.keymap.set("n", "H", "<C-U>", { desc = "往上翻半页" })
vim.keymap.set("n", "L", "<C-D>", { desc = "往下翻半页" })
vim.keymap.set("n", "U", "<C-R>", { desc = "撤销回退" })

vim.keymap.set("v", "p", '"_dP', {silent = true})
vim.keymap.set("v", "<leader>y", '"+y', {silent = true, desc = "复制到系统剪贴板"})
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, desc = "复制到系统剪贴板" })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, desc = "复制到系统剪贴板" })


-- ctrl+/ 注释当前行
vim.keymap.set("n", "<c-_>", "gccj", { desc = "注释选中行", remap = true, noremap = true, silent = true })
vim.keymap.set("i", "<c-_>", "<ESC>gccj", { desc = "注释选中行", remap = true, noremap = true, silent = true })
vim.keymap.set("v", "<C-_>", "gc", { desc = "注释选中行", remap = true, noremap = true, silent = true })

-- 缩进后保持选择
vim.keymap.set("v", "<", "<gv", { desc = "向左缩进" })
vim.keymap.set("v", ">", ">gv", { desc = "向右缩进" })


