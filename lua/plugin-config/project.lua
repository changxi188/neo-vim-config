local _, project = pcall(require, "project_nvim")
if not _ then
    vim.notify("没有找到 project_nvim")
  return
end

-- nvim-tree 支持
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
  detection_methods = { "pattern" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".sln" },
})

local _, telescope = pcall(require, "telescope")
if not _ then
  vim.notify("没有找到 telescope")
  return
end

pcall(telescope.load_extension, "projects")

