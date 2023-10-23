  call plug#begin("/Users/bob/.vim/plugins")
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'preservim/nerdtree'
    "Plug 'github/copilot.vim'
  call plug#end()
  
  syntax enable
  set number
  set relativenumber
  set backspace=indent,eol,start " Intuitive backspace behavior.

  set autoindent
  set expandtab
  set shiftround
  set shiftwidth=4
  set tabstop=4
  set smarttab
  set noexpandtab     " tabs are used, not spaces


  set ruler
  set cursorline
  set title

  set wildmenu
  set incsearch
  set hlsearch

  set ignorecase
  set smartcase

  set backup      " keep a backup file
  set backupdir=~/.vim/backup
  " Maps NERDTree to F2 "
  map <F2> :NERDTreeToggle<CR>
  " map tap to autocomplete
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"


  " autoformat with 42 format on save  
function! FormatWithClang()
  if &modified
    echo "Buffer has unsaved changes. Save before formatting."
    return
  endif

  let l:current_file = expand('%:p')
  let l:format_file = '~/.vim/.clang-format'  " specify the path to your custom config
  " Replace the '~' with the actual path to the home directory if the below command doesn't work
  exec '!' . 'clang-format -i --style=file -assume-filename=' . l:format_file . ' ' . l:current_file

  " Temporarily set the current buffer as unmodified (as if it's just been saved)
  setlocal nomodified
  " Force Vim to reload the current file
  edit!
endfunction

command! ClangFormat call FormatWithClang()
nnoremap <leader>cf :ClangFormat<CR>
