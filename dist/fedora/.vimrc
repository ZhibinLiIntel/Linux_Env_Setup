" Powerline
set rtp+=/usr/share/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set number
set hlsearch

"autocmd VimEnter * nested :TlistToggle
let g:winManagerWindowLayout='FileExplorer|TagList'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Auto_Open=1
"set tags=./tags;,tags
set tags=./tags;/

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set background=dark
set cindent
set nocompatible
set foldmethod=syntax
set nofoldenable
set hidden

"execute pathogen#infect()
"syntax on
"filetype plugin indent on

"let g:nerdtree_tabs_open_on_console_startup = 1
"let g:nerdtree_tabs_smart_startup_focus = 2
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 30
let g:NERDTreeShowHidden = 1
 
function! CheckLeftBuffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
          \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
          \ exists('t:NERDTreeBufName') &&
          \   bufname(winbufnr(i)) == t:NERDTreeBufName ||
          \ bufname(winbufnr(i)) == '__Tag_List__'
        let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      qall
    endif
    unlet i
  endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

map <C-n> :NERDTreeToggle<CR>
map <C-p> :bn<CR>
map <F2> :TlistToggle<CR>
map <C-j> :tn<CR>
map <C-k> :tp<CR>

noremap <C-i> :tabclose<CR>
