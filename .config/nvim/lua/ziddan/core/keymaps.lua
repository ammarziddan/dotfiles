vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- qol
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Moves down in buffered with cursor centered" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Moves up in buffered with cursor centered" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertical" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tb", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Navigate pane
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus tab to left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus tab to right" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus tab to up" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus tab to down" })

-- Auto indent on empty line with 'a' or 'A'
local function InsertModeWithIndent(key)
  local current_line = vim.api.nvim_get_current_line()
  -- %g represents all printable characters except whitespace
  if string.len(current_line) == 0 or string.match(current_line, "%g") == nil then
    return [["_cc]]
  else
    return key
  end
end

keymap.set("n", "a", function()
  return InsertModeWithIndent("a")
end, { noremap = true, expr = true })
keymap.set("n", "A", function()
  return InsertModeWithIndent("A")
end, { noremap = true, expr = true })
