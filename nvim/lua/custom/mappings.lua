local M = {}
M.telescope = {
  n = {
    -- find
    ["<leader>ps"] = { "<cmd> Telescope find_files <CR>", "find files" },
  },
}
M.general = {
  n = {
    -- Tmux navigation
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
    -- collaps
    ["<leader>t"] = { "<cmd> NvimTreeCollapse <CR>", "Collapse nvimtree" },
  },
}
return M
