-- Set the key mapping for invoking VimtexCompile
vim.api.nvim_set_keymap('n', '<Leader>c', ':VimtexCompile<CR>', { noremap = true, silent = true })

-- Enable spell checking
vim.cmd('setlocal spell')
vim.cmd('set spelllang=nl,en_gb')

-- Create an insert mode mapping for <C-l>
vim.api.nvim_set_keymap('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', { noremap = true, silent = true })

local function add_to_dictionary(word)
    local cmd = string.format([[silent! exe printf("spell add %s", "%s")]], vim.fn.fnameescape(word), vim.fn.expand("%:p"))
    vim.api.nvim_command(cmd)
end

add_to_dictionary("supremum")
