set showmode
set nowrap
set autoindent
set copyindent
set showmatch
set incsearch
set number
set showcmd
set visualbell
set noerrorbells
set background=dark
set linebreak
set smartcase
set hlsearch
set expandtab
set shiftround
set smarttab
set tabstop=3
set shiftwidth=3
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50
set nobackup
set nowritebackup
set noswapfile
set backspace=indent,eol,start
set directory=~/.vim/.tmp,~/tmp,/tmp
set laststatus=2

syntax enable

" mappings
inoremap jj <Esc>

" statusline colors
hi StatusLine   cterm=NONE ctermfg=231 ctermbg=0 guifg=#ffffff guibg=#000000
hi StatusLineNC cterm=NONE ctermfg=231 ctermbg=0 guifg=#969696 guibg=#000000
hi User1        cterm=NONE ctermfg=231 ctermbg=0 guifg=#ffffff guibg=#000000 " for filename
hi User2        cterm=NONE ctermfg=253 ctermbg=0 guifg=#dadada guibg=#000000 " for file info
hi User3        cterm=NONE ctermfg=159 ctermbg=0 guifg=#9cffd3 guibg=#000000 " for special info
hi User4        cterm=NONE ctermfg=222 ctermbg=0 guifg=#ffd787 guibg=#000000 " for warnings/modified

" get current git branch
function! GitBranch()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0 ? '  '.l:branchname.' ' : ''
endfunction

" get file size
function! FileSize()
  let l:bytes = getfsize(expand('%:p'))
  if (l:bytes >= 1024)
    let l:kbytes = l:bytes / 1024
  endif
  if (exists('l:kbytes') && l:kbytes >= 1000)
    let l:mbytes = l:kbytes / 1000
  endif
  
  if l:bytes <= 0
    return '0'
  endif
  
  if (exists('l:mbytes'))
    return l:mbytes . 'MB'
  elseif (exists('l:kbytes'))
    return l:kbytes . 'KB'
  else
    return l:bytes . 'B'
  endif
endfunction

" build statusline
set statusline=
set statusline+=%1*\ %<%F\                              " File path
set statusline+=%2*\ %y\                                " File type
set statusline+=%3*%{GitBranch()}                       " Git branch
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}\   " File encoding
set statusline+=%2*\ %{&ff}\                            " File format
set statusline+=%2*\ %{FileSize()}\                     " File size
set statusline+=%=                                      " Right align
set statusline+=%2*\ %3p%%\                             " Percentage through file
set statusline+=%2*\ %3l:%-2c\                          " Line and column info
set statusline+=%4*\ %m%r%w\ \                          " Modified, Read-only, Preview flags