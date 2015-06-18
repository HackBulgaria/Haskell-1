## Setting up the haskell environment
For now, we'll be using the text editor + ghci "method", later we'll introduce some Haskell IDEs.

I myself prefer Vim as a text editor, but as there aren't many Vim enthusiasts, I'll add some notes about Sublime, a little more user-friendly editor.
* Note: In the beginning, you won't really need Linter and Checker, so you can set them up later

### Installing Haskell Compiler and Interactive environment
* Download and install [Haskell Platform](https://www.haskell.org/platform/). Includes cabal, ghc and useful libraries.

### My Own Vim Setup
* [pathogen](https://github.com/tpope/vim-pathogen) (for managing vim plugins)
* [ghc-mod](https://github.com/eagletmt/ghcmod-vim) (for HLint and HCheck)
* [neco-ghc](https://github.com/eagletmt/neco-ghc/) (for autocompletion)
* finally, in ~/.vim/ftplugin/haskell.vim

```VimL
set tabstop=2 shiftwidth=2
setlocal omnifunc=necoghc#omnifunc

" Running HCheck and HLint on write
au BufWritePost *.hs :GhcModCheckAndLintAsync
```

### Sublime Setup
* install [sublime](http://www.sublimetext.com/3)
* then [package control](https://packagecontrol.io/installation)
* install SublimeHaskell plugin: In Sublime - Ctrl-Shift-P (Command Palette). Then write Install, pick Install Package, select SublimeHaskell.
* Write `haskell` in the Command Palette to see all of the available options

##### You can add the following to your sublime settings:
```
  "tab_size": 2,
  "translate_tabs_to_spaces": true,
  "trim_trailing_white_space_on_save": true

```
