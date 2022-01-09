local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local keymap = vim.api.nvim_set_keymap

telescope.setup{
  defaults = {
    prompt_prefix = "  ",
    selection_caret = "  ",
    path_display = { "smart" },
  },
  pickers = {
    find_files = {
    theme = "ivy",
      layout_config={
        height = 36,
      },
    }
  }
}

telescope.load_extension("git_worktree")

keymap('n', '<C-P>', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
keymap('n', '<C-F>', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
keymap('n', '<C-B>', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
keymap('n', '<C-T>', "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { noremap = true })
