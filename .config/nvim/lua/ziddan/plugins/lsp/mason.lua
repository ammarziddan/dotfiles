return {
  -- mason
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
  },

  -- mason-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      -- servers for mason to install
      ensure_installed = {
        "emmet_language_server", -- emmet for html css js etc
        "lua_ls", -- Lua
        "ts_ls", -- Javascript, Typescript
        "cssls", -- CSS, SCSS, LESS
        "tailwindcss", -- html, javascript, javascriptreact, typescript, typescriptreact, vue, svelte
        "html", -- HTML
        "jsonls", -- JSON
        "marksman", -- Markdown
        "intelephense", -- PHP
      },
    },
  },

  -- mason-tool-installer
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "black",
        "php-cs-fixer",
        "prettier",
        "stylua",
      },
    },
  },
}
