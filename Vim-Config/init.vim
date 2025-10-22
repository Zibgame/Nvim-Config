" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    init.vim                                            :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: zcadinot <zcadinot@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2025/10/22  by zcadinot                #+#    #+#              "
"    Updated: 2025/10/22  by zcadinot                ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" =======================
" ⚙️ Options générales
" =======================
set nocompatible
filetype plugin indent on
syntax on
set mouse=a
set clipboard=unnamedplus
set termguicolors
set noshowmode
set encoding=UTF-8
set cmdheight=1
set laststatus=2
set number
set relativenumber

" =======================
" 👤 Variables personnelles
" =======================
let g:user42 = 'zcadinot'
let g:mail42 = 'zcadinot@student.42.fr'

" =======================
" 🔌 Gestionnaire de plugins (vim-plug)
" =======================
call plug#begin('~/.local/share/nvim/plugged')

" --- 🎨 Thèmes ---
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'flazz/vim-colorschemes'

" --- 🧩 Icônes ---
Plug 'ryanoasis/vim-devicons'

" --- 📁 Explorateur de fichiers ---
Plug 'preservim/nerdtree'

" --- 📊 Barre de statut ---
Plug 'itchyny/lightline.vim'

" --- 🧠 Outils de code ---
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'

" --- 🧬 Syntaxe améliorée ---
Plug 'sheerun/vim-polyglot'

" --- 🌈 Divers ---
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'psliwka/vim-smoothie'
Plug 'Zibgame/Vim-C_compiler'
Plug '42Paris/42header'

" --- 💫 Effet fluide du curseur ---
Plug 'sphamba/smear-cursor.nvim'

call plug#end()

" =======================
" 💫 smear-cursor (effet fluide)
" =======================
lua << EOF
require('smear_cursor').setup({
  stiffness = 0.65,          -- élasticité
  trailing_stiffness = 0.25, -- traînée
  distance_stop_animating = 0.05,
})
EOF

" =======================
" 💡 Lightline
" =======================
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'modified' ] ]
      \ },
      \ 'component_expand': {
      \   'gitbranch': 'fugitive#head'
      \ }
      \ }

set laststatus=2

" =======================
" 🎨 Thème par défaut
" =======================
colorscheme dracula

" =======================
" 🪄 Mappings rapides
" =======================
let mapleader = " "

" Sortie rapide du mode insert
inoremap jk <Esc>
inoremap kj <Esc>

" Arbre de fichiers
nnoremap <C-n> :NERDTreeToggle<CR>

" Sauvegarde rapide
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Undo rapide
nnoremap <C-z> :u<CR>
inoremap <C-z> <Esc>:u<CR>a

" =======================
" 🚀 EasyMotion
" =======================
nmap <Leader>f <Plug>(easymotion-bd-f)

" =======================
" 🏁 Startify
" =======================
let g:startify_custom_header = [
      \ '░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ▒▓██████████████▓▒░  ',
      \ '░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ',
      \ ' ░▒▓█▓▒▒▓█▓▒░░░▒▓█▓▒░ ▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ',
      \ ' ░▒▓█▓▒▒▓█▓▒░░░▒▓█▓▒░ ▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ',
      \ '  ░▒▓█▓▓█▓▒░  ░▒▓█▓▒░ ▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ',
      \ '  ░▒▓█▓▓█▓▒░  ░▒▓█▓▒░ ▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ',
      \ '   ░▒▓██▓▒░   ░▒▓█▓▒░ ▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░  ',
      \ '  ',
      \ '      [p] Plugins       [n] NERDTree'
      \ ]

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Mes fichiers récents']       },
      \ { 'type': 'bookmarks', 'header': ['   Mes favoris']               },
      \ { 'type': 'sessions',  'header': ['   Mes sessions sauvegardées']},
      \ ]

let g:startify_custom = [
      \ { 'type': 'commands', 'header': ['   Raccourcis Utiles'], 'content': [
      \     {'c': 'NERDTreeToggle', 'd': 'Ouvrir / fermer NERDTree'},
      \     {'c': 'PlugStatus', 'd': 'Voir l’état des plugins'},
      \ ]}
      \ ]

nnoremap <leader>m :call StartifyMenu()<CR>
nnoremap <leader>p :PlugStatus<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

augroup startify_mappings
  autocmd!
  autocmd FileType startify call StartifyMappings()
augroup END

function! StartifyMappings()
  nnoremap <buffer> p :PlugStatus<CR>
  nnoremap <buffer> n :NERDTreeToggle<CR>
endfunction

