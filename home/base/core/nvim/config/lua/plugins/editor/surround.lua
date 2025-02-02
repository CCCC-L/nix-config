return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  opts = {
    surrounds = {
      ["("] = {
        add = { "(", ")" },
        find = function()
          return M.get_selection({ motion = "a(" })
        end,
        delete = "^(. ?)().-( ?.)()$",
      },
      ["{"] = {
        add = { "{", "}" },
        find = function()
          return M.get_selection({ motion = "a{" })
        end,
        delete = "^(. ?)().-( ?.)()$",
      },
      ["<"] = {
        add = { "<", ">" },
        find = function()
          return M.get_selection({ motion = "a<" })
        end,
        delete = "^(. ?)().-( ?.)()$",
      },
      ["["] = {
        add = { "[", "]" },
        find = function()
          return M.get_selection({ motion = "a[" })
        end,
        delete = "^(. ?)().-( ?.)()$",
      },
    },
  },
}
