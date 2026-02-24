-- configure windows shell
if vim.fn.has("win32") == 1 then
  vim.o.shell = "cmd.exe"
  vim.o.shellcmdflag = "/c"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

-- Set clipboard to use OSC 52 (only for terminal that supports osc52)
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}

vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- nvim auto-session
opt.sessionoptions:append("localoptions")

-- relative number on left side
opt.relativenumber = true
opt.number = true

-- mouse events
vim.o.mouse = "a"
vim.o.mousemoveevent = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use true color terminal)
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Default: prefer Unix (LF)
vim.opt.fileformats = { "unix", "dos" }
vim.opt.fileformat = "unix"

-- Windows-native scripts should stay CRLF
if vim.fn.has("win32") == 1 then
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.bat", "*.cmd", "*.ps1" },
    callback = function()
      vim.opt_local.fileformat = "dos"
    end,
  })
end
