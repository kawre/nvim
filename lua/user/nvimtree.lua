local ok, tree = pcall(require, "nvim-tree")
if not ok then
  return
end

tree.setup {
  hijack_cursor = true,
  update_focused_file = { enable = true },
  view = {
    width = 40,
    hide_root_folder = true,
  }
}
