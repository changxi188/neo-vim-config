local status, db  = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.setup({
  theme = 'hyper',
  config = {
    week_header = {
    enable = true,
    },
    shortcut = {
      { desc = '󰊳 init.lua',
        group = '@property',
        action = 'edit ~/.config/nvim/init.lua',
        key = 'e'
      },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' Projects',
        group = 'DiagnosticHint',
        action = 'Telescope projects',
        key = 'p',
      },
      {
        desc = ' Oldfiles',
        group = 'Number',
        action = 'Telescope oldfiles',
        key = 'o',
      },
    },

        footer = function()
            local footer = {'', '🎉 good good study, day day up!!!🎉 '}
            if packer_plugins ~= nil then
                footer[1] = ''
                -- local count = #vim.tbl_keys(packer_plugins)
                --footer[2] = 'neovim loaded ' .. count .. ' plugins'
                --[[
                for key, _ in pairs(packer_plugins) do
                    table.insert(footer, '✨  ' .. key)
                end
                ]]--
            end
            return footer
        end

  },
})


--local status, db = pcall(require, "dashboard")
--if not status then
--    vim.notify("没有找到 dashboard")
--    return
--end
--
--db.setup({
--    theme = 'doom',
--    config = {
--        header = {
--        }, --your header
--        center = {
--            {
--              icon = "  ",
--              desc = "Projects                            ",
--              action = "Telescope projects",
--            },
--            {
--                icon = "  ",
--                desc = "Recently files                      ",
--                action = "Telescope oldfiles",
--
--            },
--            {
--                icon = "  ",
--                desc = "Edit Projects                       ",
--                action = "edit ~/.local/share/nvim/project_nvim/project_history",
--            },
--            {
--                icon="  ",
--                desc =  "Change Themes",
--                action = 'Telescope colorscheme'
--            },
--
--        },
--
--        footer = function()
--            local footer = {'', '🎉 good good study, day day up!!!🎉 '}
--            if packer_plugins ~= nil then
--                footer[1] = ''
--                -- local count = #vim.tbl_keys(packer_plugins)
--                --footer[2] = 'neovim loaded ' .. count .. ' plugins'
--                --[[
--                for key, _ in pairs(packer_plugins) do
--                    table.insert(footer, '✨  ' .. key)
--                end
--                ]]--
--            end
--            return footer
--        end
--    }
--})

--db.setup({
--    theme = 'doom',
--    config = {
--        header = {
--            [[]],
--            [[     ██╗██╗   ██╗███████╗     ██╗██╗███╗   ██╗]],
--            [[     ██║██║   ██║██╔════╝     ██║██║████╗  ██║]],
--            [[     ██║██║   ██║█████╗       ██║██║██╔██╗ ██║]],
--            [[██   ██║██║   ██║██╔══╝  ██   ██║██║██║╚██╗██║]],
--            [[╚█████╔╝╚██████╔╝███████╗╚█████╔╝██║██║ ╚████║]],
--            [[ ╚════╝  ╚═════╝ ╚══════╝ ╚════╝ ╚═╝╚═╝  ╚═══╝]],
--            [[                                              ]],
--            [[             [ version : 1.0.0 ]              ]],
--            [[]],
--            [[]],
--        },
--
--
--        center = {
--            {
--                icon = "  ",
--                desc = "Projects                            ",
--                action = "Telescope projects",
--            },
--            {
--                icon = "  ",
--                desc = "Recently files                      ",
--                action = "Telescope oldfiles",
--            },
--            {
--                icon = "  ",
--                desc = "Edit keybindings                    ",
--                action = "edit ~/.config/nvim/lua/keybindings.lua",
--            },
--            {
--                icon = "  ",
--                desc = "Edit Projects                       ",
--                action = "edit ~/.local/share/nvim/project_nvim/project_history",
--            },
--        },
--
--        footer = {
--            "",
--            "",
--            "https://github.com/nshen/learn-neovim-lua",
--        }
--    }
--})
--
--


--[[
db.custom_footer = {
  "",
  "",
  "https://github.com/nshen/learn-neovim-lua",
}

db.custom_center = {
  {
    icon = "  ",
    desc = "Projects                            ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Edit keybindings                    ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    icon = "  ",
    desc = "Edit Projects                       ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
  -- {
  --   icon = "  ",
  --   desc = "Edit .bashrc                        ",
  --   action = "edit ~/.bashrc",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Change colorscheme                  ",
  --   action = "ChangeColorScheme",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Edit init.lua                       ",
  --   action = "edit ~/.config/nvim/init.lua",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Find file                           ",
  --   action = "Telescope find_files",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Find text                           ",
  --   action = "Telescopecope live_grep",
  -- },
}
]]--
