function ColorMyPencils(color)
	color = color or "rose-pine-dawn"
	-- color = color or "nord"
	vim.cmd.colorscheme(color)

	-- Make Vim transparent
	--	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	--	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

ColorMyPencils()
