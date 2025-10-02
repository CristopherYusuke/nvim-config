  return { 
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
                vsclinenumber = '#ffffff',
            },
            group_overrides = {
                cursor = { fg=c.vscdarkblue, bg=c.vsclightgreen, bold=true },
            }
        })
        vim.cmd.colorscheme "vscode"
    end 
  }
