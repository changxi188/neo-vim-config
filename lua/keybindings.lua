-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
    noremap = true,
    silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

-- $跳到行尾不带空格 (交换$ 和 g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)

-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })

map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)

-- fix :set wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- 上下滚动浏览
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<F3>", "10k", opt)
map("n", "<F4>", "10j", opt)
map("n", "<leader>u", "10k", opt)
map("n", "<leader>d", "10j", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 在visual mode 里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 保存
map("n", "<C-s>", ":wa<CR>", opt)
map("i", "<C-s>", "<ESC>:wa<CR>", opt)

-- 退出
map("n", "qq", ":q!<CR>", opt)
map("n", "qa", ":qa!<CR>", opt)
map("n", "<leader>q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
-- map("i", "<C-h>", "<ESC>I", opt)
-- map("i", "<C-l>", "<ESC>A", opt)

------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others
-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- <leader> + hjkl 窗口之间跳转
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Right>", ":vertical resize -2<CR>", opt)
map("n", "<C-Left>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -10<CR>", opt)
map("n", "s.", ":vertical resize +10<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 相等比例
map("n", "s=", "<C-w>=", opt)

-- Terminal相关
map("n", "st", ":sp | terminal<CR>", opt)
map("n", "stv", ":vsp | terminal<CR>", opt)
-- Esc 回 Normal 模式
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]], opt)


--------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}

-- treesitter 折叠
map("n", "zz", ":foldclose<CR>", opt)
map("n", "Z", ":foldopen<CR>", opt)

-- nvim-tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)
pluginKeys.nvimTreeList = function (bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- use all default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- override default mappings
    vim.keymap.set('n', 't',     api.node.open.tab,                  opts('Open: New Tab'))
    vim.keymap.set('n', 'v', api.node.open.vertical,                opts('Open: Vertical Split'))
    vim.keymap.set('n', 's', api.node.open.horizontal,              opts('Open: Horizontal Split'))
end

-- bufferline
--"moll/vim-bbye"
-- 关闭buffer
map("n", "<C-w>", ":Bdelete!<CR>", opt)
-- 左右buffer切换
map("n", "<A-u>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-i>", ":BufferLineCycleNext<CR>", opt)
-- 左右移动buffer
map("n", "<A-S-u>", ":BufferLineMovePrev<CR>", opt)
map("n", "<A-S-i>", ":BufferLineMoveNext<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<F3>"] = "preview_scrolling_up",
        ["<F4>"] = "preview_scrolling_down",
    },
}
-- 系统环境变量
map("n", "<A-e>", ":Telescope env<CR>", opt)

-- vimspector 快捷键
pluginKeys.mapVimspector = function()
    -- 开始
    map("n", "<leader>dd", ":call vimspector#Launch()<CR>", opt)
    -- 结束
    map("n", "<Leader>de", ":call vimspector#Reset()<CR>", opt)
    -- 继续
    map("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opt)
    -- 设置断点
    map("n", "<Leader>dt", ":call vimspector#ToggleBreakpoint()<CR>", opt)
    map("n", "<Leader>dT", ":call vimspector#ClearBreakpoints()<CR>", opt)
    --  stepOver, stepOut, stepInto
    map("n", "<leader>dj", "<Plug>VimspectorStepOver", opt)
    map("n", "<leader>dk", "<Plug>VimspectorStepOut", opt)
    map("n", "<leader>dl", "<Plug>VimspectorStepInto", opt)
end


-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
    -- Normal 模式快捷键
    toggler = {
        line = "gcc", -- 行注释
        block = "gbc", -- 块注释
    },
    -- Visual 模式
    opleader = {
        line = "gc",
        bock = "gb",
    },
}

-- ctrl + /
map("n", "<C-/>", "gcc", opt)
map("v", "<C-/>", "gcc", opt)

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    -- code action
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    -- go xx
    mapbuf("n", "<F2>", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    -- diagnostic
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opt)
        --mapbuf("n", lsp.format, "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")

    -- 没用到
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<Tab>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<F3>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<F4>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    }
end


return pluginKeys
