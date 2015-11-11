# vimrc

## 关于

我自己使用的 [vim](http://www.vim.org) 的配置. 该配置插件使用 [Vundle.vim](https://github.com/gmarik/Vundle.vim) 进行管理.

## 如何使用

### 1. 安装

需要安装 `Git`、`Vundle.vim`

```
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### 2. 使用该配置, 并 `git clone` 下该项目:

```
$ git clone https://github.com/stenote/vimrc /tmp/vimrc/
```

### 3. 复制 .vimrc 到 `$HOME`

```
$ cp /tmp/vimrc/vimrc $HOME/.vimrc
```

### 4. 安装对应插件

进入到 **vim** 中执行 `:PluginInstall`, 安装完成后重新启动 **vim** 即可.

## 已有插件

* SuperTab
* molokai
* bling/vim-airline
* scrooloose/nerdtree
* scrooloose/nerdcommenter
