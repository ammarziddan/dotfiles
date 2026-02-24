return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local mode_colors = function(set_n_mode_bold)
      local colors = {
        n = { bg = "#7aa2f7" }, -- insert
        i = { bg = "#9ece6a" }, -- insert
        v = { bg = "#bb9af7" }, -- visual
        V = { bg = "#bb9af7" }, -- visual line
        ["\22"] = { bg = "#bb9af7" }, -- visual block
        c = { bg = "#e0af68" }, -- command
        R = { bg = "#f7768e" }, -- replace
        t = { bg = "#73daca" }, -- terminal
      }

      if set_n_mode_bold then
        for _, v in pairs(colors) do
          v.gui = "bold"
        end
      end

      return colors[vim.fn.mode()]
    end

    require("lualine").setup({
      options = {
        -- theme = "tokyonight",
        theme = "nightfly",
        section_separators = "",
        component_separators = "│",
      },
      sections = {
        lualine_a = {
          {
            "mode",
            color = function()
              return mode_colors(true)
            end,
          },
        },
        lualine_b = {
          {
            "branch",
            color = { fg = "#c0caf5" },
          },
          { "diff" },
          { "diagnostics" },
        },
        lualine_c = {
          {
            "filename",
            color = { fg = "#c0caf5" },
          },
        },
        lualine_x = {
          {
            "encoding",
            color = { fg = "#c0caf5" },
          },
          {
            "fileformat",
            color = { fg = "#c0caf5" },
          },
          {
            "filetype",
            color = { fg = "#c0caf5" },
          },
        },
        lualine_y = {
          {
            "progress",
            color = { fg = "#c0caf5" },
          },
        },
        lualine_z = {
          {
            "location",
            color = function()
              return mode_colors(false)
            end,
          },
        },
      },
    })
  end,
}
