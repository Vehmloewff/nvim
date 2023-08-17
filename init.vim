lua require('init')

set tabstop=4
set shiftwidth=4

" Autosave files when a buffer looses focus
" It would be nice to do this in lua, but I can't figure that out currently
autocmd BufLeave,FocusLost * silent! wall

