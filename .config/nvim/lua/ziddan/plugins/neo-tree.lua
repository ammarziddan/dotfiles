return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      require("neo-tree").setup({

        default_component_configs = {
          indent = {
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          git_status = {
            symbols = {
              -- Change type
              added = "✚",
              deleted = "✖",
              modified = "",
              renamed = "󰁕",
              -- Status type
              untracked = "",
              ignored = "",
              unstaged = "󰄱",
              staged = "",
              conflict = "",
            },
          },
        },

        window = {
          position = "right",
          width = 30,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
        },

        popup_border_style = "rounded",

        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_ignored = false,
            hide_hidden = false,
          },
          window = {
            mappings = {
              ["W"] = "close_all_nodes",
              ["z"] = "noop",
            },
          },
        },

        -- keymaps
        vim.keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<CR>", { desc = "Toggle File Explorer" }),
        vim.keymap.set("n", "<leader>er", "<cmd>Neotree reveal toggle<CR>", { desc = "Toggle File Explorer Reveal" }),
      })
    end,
  },
}
