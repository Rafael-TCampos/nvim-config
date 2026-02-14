" Opções Gerais
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set norelativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

filetype plugin indent on
syntax on
set t_Co=256

" Italics e Encoding
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
set encoding=UTF-8

call plug#begin()
    Plug 'elvessousa/sobrio'
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdtree'
    Plug 'kien/ctrlp.vim'
    " PLUGIN CORRIGIDO AQUI (Sem erro E399)
    Plug 'ap/vim-css-color' 
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'thaerkh/vim-indentguides'
    Plug 'cohama/lexima.vim'
    Plug 'preservim/nerdcommenter'
    Plug 'mattn/emmet-vim'
    Plug 'neoclide/coc-emmet'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'plasticboy/vim-markdown'
    Plug 'airblade/vim-gitgutter'
    Plug 'kdheepak/lazygit.nvim'
    Plug 'CRAG666/code_runner.nvim'

call plug#end()

set termguicolors
colorscheme sobrio

" Airline
let g:airline_theme='sobrio'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Atalhos Normal Mode
nnoremap <C-q> :qa!<CR>
nnoremap <C-s> :w!<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <F1> :bprevious<CR>
nnoremap <F2> :bnext<CR>
" Atalho para abrir o LazyGit
nnoremap <silent> <C-g> :LazyGit<CR>

" Configuração de Comentários (cc)
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
nnoremap cc :call nerdcommenter#Comment('x', 'toggle')<CR>
vnoremap cc :call nerdcommenter#Comment('x', 'toggle')<CR>

" Configuração CoC + Emmet no TAB
" Tab Inteligente: CoC + Emmet
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Esse comando garante que o Emmet dispare com o Tab do teclado
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


"" Visual (Números e Linha do Cursor)
highlight LineNr guifg=#555555 guibg=NONE
highlight CursorLineNR guifg=#ffcc00 gui=bold
highlight CursorLine guibg=NONE gui=underline guisp=#444444

let g:loaded_node_provider = 1  " Mantém o node ativo
let g:loaded_perl_provider = 0  " Desativa o aviso de Perl
let g:loaded_ruby_provider = 0  " Desativa o aviso de Ruby


" Formatar o código automaticamente ao salvar (Prettier)
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.html,*.json Prettier

" Configuração segura do Code Runner
lua << EOF
local status, runner = pcall(require, 'code_runner')
if status then
  runner.setup({
    filetype = {
      javascript = "node",
      html = "google-chrome-stable",
    },
  })
end
EOF


" Atalho para rodar o código
nnoremap <silent> <C-r> :RunCode<CR>

