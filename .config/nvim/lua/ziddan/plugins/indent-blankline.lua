return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  ---@module "ibl"
  ---@type ibl.config
  config = function()
    -- visible whitespace
    -- vim.opt.list = true
    -- vim.opt.listchars = {
    -- 	tab = "▏",
    -- 	space = "·", -- dot for space
    -- 	-- trail = "·", -- dot for end of line space
    -- 	-- nbsp = "·", -- dot for non-breaking space
    -- }

    require("ibl").setup({
      indent = {
        char = "┆",
      },
      whitespace = {
        remove_blankline_trail = false,
      },
    })
  end,
}
