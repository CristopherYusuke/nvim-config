require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

local rtp = vim.opt.rtp

rtp:prepend(lazypath)
require('lazy').setup( {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },
  { 
 'Mofiqul/vscode.nvim',
 lazy = false ,
 priority = 1000,
 config = function () 
	vim.o.background = 'dark'
	local c = require('vscode.colors').get_colors()
	require('vscode').setup({ 
	    italic_comments=true, 
	    italic_comments = true,
        italic_inlayhints = true,
        underline_links = true,
        disable_nvimtree_bg = true,
        terminal_colors = true,
        color_overrides = {
            vscLineNumber = '#FFFFFF',
        },
        group_overrides = {
            Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
        }
	})
	vim.cmd.colorscheme "vscode"
    end 
  }
}) 










