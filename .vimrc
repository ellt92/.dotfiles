"""""""""""""""""""""""""""""""
"" My Plugins ""
"""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"# Layout and file management
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'bagrat/vim-workspace'
"# Syntax
Plugin 'mxw/vim-jsx'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'SirVer/ultisnips'
Plugin 'elzr/vim-json'
"# C Tag Management
Plugin 'ludovicchabant/vim-gutentags'
"# Styling
Plugin 'Yggdroot/indentLine'
Plugin 'ayu-theme/ayu-vim'
"Plugin 'ryanoasis/vim-devicons'
call vundle#end()
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""""""""""""""""""""""""""""""""
"" Configurations ""
""""""""""""""""""""""""""""""""

""""""""""""""""""
"" Basic Config ""
""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
set splitbelow
set splitright

"" Styling
syntax enable
set termguicolors     " enable true colors support
let ayucolor="mirage"  " for light version of theme
colorscheme ayu

""layout
set ambiwidth=double
set number
set relativenumber
filetype plugin on
set invlist                     " toggle invisible characters
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none
""" Indenting configs ""
filetype plugin indent on
set tabstop=4                   " show existing tab with 4 spaces width
set shiftwidth=4                " when indenting with '>', use 4 spaces width
set expandtab                   " On pressing tab, insert 4 spaces
" IndentLine {{
let g:indentLine_char = '⁞'
let g:indentLine_first_char = '⁞'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

""""""""""""""""""
"" Mappings ""
""""""""""""""""""
"" esc key map
inoremap lkj <esc>
vnoremap lkj <esc>
"" page up and down remaps
"" easier command line
nnoremap ; :
"" nerdtree
map <C-n> :NERDTreeToggle<CR>
map NN :NERDTreeFind<CR>
"" vim splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"" ctrlp
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR> noremap <leader>b :CtrlPBuffer<CR>

""""""""""""""""""""""
"" Lightline Config ""
""""""""""""""""""""""
"let g:lightline = {
"  \ 'colorscheme': 'onedark',
"  \ }
"set laststatus=2
"let g:airline_theme='ayu'

"""""""""""""""""""""
""NERDTree Configs ""
"""""""""""""""""""""
let g:NERDTreeDirArrowExpandable = '﯀'
let g:NERDTreeDirArrowCollapsible = '﮾'
"let g:NERDTreeDirArrowExpandable = '⇢'
"let g:NERDTreeDirArrowCollapsible = '⇣'
let NERDTreeIgnore = ['\.pyc$']

""""""""""""""""""""""
"" UltiSnips config ""
""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<F1>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""""""""
"" syntastic ""
"""""""""""""""
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

"""""""""""""""""""""""""""
" CSS colour highlighter ""
"""""""""""""""""""""""""""
let g:cssColorVimDoNotMessMyUpdatetime = 1

"""""""""""""""""""""
"" json formatting ""
"""""""""""""""""""""
com! FormatJSON %!python -m json.tool
" concealing
let g:vim_json_syntax_conceal = 0

"""""""""""""""
"" ctrlp.vim ""
"""""""""""""""
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,node_modules,bower_components,logs,build
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0

"""""""""""""""""""""
"""""""""""""""""""""
"" NON USER CONFIG ""
"""""""""""""""""""""
"""""""""""""""""""""
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
" Arguments:
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  echo msg
  let @"=reg_saved
endfunction

let autoreadargs={'autoread':1}
execute WatchForChanges("*",autoreadargs)
