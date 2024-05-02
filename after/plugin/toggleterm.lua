local toggleterm = require('toggleterm')

toggleterm.setup {
    size = 20,
    open_mapping = [[<C-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_terminals = true,
    shade_filetypes = {},
    shading_factor = 10,    -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = 'float',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell,  -- change the default shell
}
