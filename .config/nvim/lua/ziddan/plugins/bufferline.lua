return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "tabs",
      hover = {
        enabled = true,
        delay = 75,
        reveal = { "close" },
      },
      highlights = {
        tab_separator_selected = {
          fg = "<colour-value-here>",
          bg = "<colour-value-here>",
          sp = "<colour-value-here>",
          underline = "<colour-value-here>",
        },
        background = {
          bg = "16161e",
        },
      },
    },
  },
}
