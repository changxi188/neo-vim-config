-- /Users/nn/.local/share/nvim/site/pack/packer/start/vimspector
require("keybindings").mapVimspector()

-- vimspector窗口调整
-- vim.g.vimspector_enable_winbar = 0
-- vim.g.vimspector_sidebar_width = 75
-- vim.g.vimspector_code_minwidth = 120
-- vim.g.vimspector_bottombar_height = 5
-- vim.g.VimspectorTerminalOpened = "5"

-- 设置基本尺寸
vim.g.vimspector_sidebar_width = 80
vim.g.vimspector_code_minwidth = 120
vim.g.vimspector_code_maxwidth = 120
vim.g.vimspector_terminal_minwidth = 120
vim.g.vimspector_terminal_maxwidth = 120
-- vim.g.vimspector_terminal_height = 20
vim.g.vimspector_variables_display_mode = 'full'

-- 自定义UI函数
local function customise_ui()
  -- 切换到输出窗口并关闭它
  vim.fn.win_gotoid(vim.g.vimspector_session_windows.output)
  vim.cmd('q')


  vim.fn.win_gotoid(vim.g.vimspector_session_windows.code)
  vim.cmd('resize 35')
  vim.cmd('set wfh')
  vim.cmd('set wfw')
  --保持窗口大小不变
  vim.fn.win_gotoid(vim.g.vimspector_session_windows.terminal)
end

-- 设置终端窗口的函数
local function setup_terminal()
  vim.fn.win_gotoid(vim.g.vimspector_session_windows.variables)
  vim.cmd('resize 12')
  vim.fn.win_gotoid(vim.g.vimspector_session_windows.watches)
  vim.cmd('vertical resize 70')
  vim.cmd('set wfh')
  vim.cmd('set wfw')

  vim.fn.win_gotoid(vim.g.vimspector_session_windows.stack_trace)
  vim.cmd('vertical resize 70')
  vim.cmd('resize 12')
  vim.cmd('set wfh')
  vim.cmd('set wfw')
  -- 切换到终端窗口并禁用行号
  vim.fn.win_gotoid(vim.g.vimspector_session_windows.terminal)
  vim.cmd('set norelativenumber nonumber')
  -- vim.cmd('resize 35')

end

-- 创建自动命令组并添加自动命令
vim.api.nvim_create_augroup('MyVimspectorUICustomisation', { clear = true })
vim.api.nvim_create_autocmd('User', {
  pattern = 'VimspectorUICreated',
  callback = customise_ui,
  group = 'MyVimspectorUICustomisation',
})
vim.api.nvim_create_autocmd('User', {
  pattern = 'VimspectorTerminalOpened',
  callback = setup_terminal,
  group = 'MyVimspectorUICustomisation',
})
