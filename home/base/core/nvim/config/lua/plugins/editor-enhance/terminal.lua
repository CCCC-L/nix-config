return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 10,
    })

    local new_base_term = function()
      return require("toggleterm.terminal").Terminal:new({
        display_name = "Base",
        count = 1,
        direction = "horizontal",
        dir = vim.fn.expand("%:p:h"),
        auto_scroll = true,
      })
    end

    local function toggle_term()
      new_base_term():toggle()
    end

    vim.keymap.set({ "n", "t" }, "<M-3>", toggle_term)
    vim.keymap.set("n", "<leader>sl", ":ToggleTermSendCurrentLine<cr>")
    vim.keymap.set("v", "<leader>sk", ":ToggleTermSendVisualSelection<cr>")

  end,
}
