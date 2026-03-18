function ColorMyPencils(color)
    color = color --[[ or "night-owl" or "catppuccin" ]] or "calvera"
    vim.cmd.colorscheme(color)

    vim.cmd('hi! LineNr guibg=none ctermbg=none')
    vim.cmd('hi! LineNr guifg=#ffffff')
    vim.cmd('hi! SignColumn guibg=none')
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
