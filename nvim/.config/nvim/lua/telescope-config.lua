local telescope = require("telescope")
local keymap = vim.api.nvim_set_keymap

telescope.setup{
  pickers = {
    find_files = {
      theme = "ivy",
    }
  }
}

telescope.load_extension("git_worktree")

keymap('n', '<C-P>', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
keymap('n', '<C-F>', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
keymap('n', '<C-B>', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
keymap('n', '<C-T>', "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { noremap = true })
