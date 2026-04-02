return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			filesystem = {
				filtered_items = {
					visible = true,
					hdie_dotfiles = false,
				},
			},
			event_handlers = {
				-- save layout before opening neotree
				{
					event = "neo_tree_window_before_open",
					handler = function()
						-- vim.cmd("set noequalalways")
						local layout = {}
						for _, win in ipairs(vim.api.nvim_list_wins()) do
							layout[win] = {
								height = vim.api.nvim_win_get_height(win),
								width = vim.api.nvim_win_get_width(win),
							}
						end
						vim._neotree_layout = layout
					end,
				},
				-- restore layout after closing neotree
				{
					event = "neo_tree_window_after_close",
					handler = function()
						if vim._neotree_layout then
							for win, dims in pairs(vim._neotree_layout) do
								if vim.api.nvim_win_is_valid(win) then
									pcall(vim.api.nvim_win_set_height, win, dims.height)
									pcall(vim.api.nvim_win_set_width, win, dims.width)
								end
							end
						end
					end,
				},
			},
		},
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function(_, opts)
			require("neo-tree").setup(opts)
			vim.keymap.set("n", "<leader>e", ":Neotree toggle position=right<CR>", { noremap = true, silent = true })
		end,
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				filter_rules = {
					include_current_win = false,
					autoselect_one = true,
					-- filter using buffer options
					bo = {
						-- if the file type is one of following, the window will be ignored
						filetype = { "neo-tree", "neo-tree-popup", "notify" },
						-- if the buffer type is one of following, the window will be ignored
						buftype = { "terminal", "quickfix" },
					},
				},
			})
		end,
	},
}
