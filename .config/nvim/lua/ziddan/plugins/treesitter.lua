return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master", -- Branch master
  lazy = false,
  build = ":TSUpdate",

  config = function()
    -- Set filetype detection for .blade.php
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "python",
        "yaml",
        "html",
        "css",
        "scss",
        "markdown",
        "markdown_inline",
        "bash",
        "php",
        "php_only",
        "gitignore",
        "lua",
        "vim",
      },
    })

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
        revision = "cc764dadcbbceb3f259396fef66f970c72e94f96",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "blade",
    }

    if not require("nvim-treesitter.parsers").has_parser("blade") then
      vim.cmd("TSInstall blade")
    end
  end,
}
