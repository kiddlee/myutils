set nu 				" 显示行号
set autoindent   	" 自动缩进
set smartindent
set hlsearch 		" 高亮检索
set tabstop=4   	" tab 设定
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set mouse=a 		" 鼠标可用
set syntax=on 		" 语法高亮
set t_Co=256 		" 颜色
set background=dark " 背景颜色

" tab 快捷键 start
" 新tab
nmap <C-t>   :tabnew<cr>
" 前一个tab
nmap <C-p>   :tabprevious<cr>
" 下一个tab
nmap <C-n>   :tabnext<cr>
" 关闭当前tab, Kill
nmap <C-k>   :tabclose<cr>
" tab 快捷键 end

" Fn 快捷键 start
" 屏蔽 help
nmap <F1>    <nop>
" save and quit Like BIOS
nmap <F10>    :wq!<cr>
" quit
nmap <F2>    :q!<cr>
" Fn 快捷键 end

" save
nmap <C-s>    :w!<cr>

" For vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' 	" Vundle 初始化插件
Plugin 'SuperTab' 		" tab 自动补全插件
Plugin 'molokai' 		" molokai 插件
Plugin 'bling/vim-airline' 	" airline 插件
Plugin 'scrooloose/nerdtree' " nerdtree
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required

" molokai  start
colorscheme molokai 			" 设定样式
" molokai end

" vim-airline start
let g:airline#extensions#tabline#enabled = 1
" vim-airline end
"

map <C-d> :NERDTreeToggle<CR>

" nerdcommenter start
" 使用 , 进行comment 调用, 例如 ,cc 进行注释
let mapleader = ","
let maplocalleader = ","
" nerdcommenter end
