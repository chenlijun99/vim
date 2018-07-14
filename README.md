# Vim

My vim/Neovim configurations

## Requirement

* vim >8.0 compiled with python and lua support \\
if you use ubuntu >16.04, then run following commands
    ```
    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt-get update
    sudo apt-get install vim
    ```
otherwise you could try to compile vim from source following this
[tutorial](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)
* or Neovim



## Optional plugins
* **git** for plugin management and other plugin (fugitive, vim-gitgutter)
* **exuberant-ctags** to provide a outline sidebar
* Look [here](https://github.com/w0rp/ale#supported-languages) for specific linters that you'd have
for some language

### Language server integration

For the following languages, instead of `ale`, language server are used.
You should manage to get them installed on your system.

* c/cpp (cquery)
* php (php-language-server)
* javascript/typescript (tsserver)

## Installation

```
git clone https://github.com/free-easy/vim
cd vim
./install.sh
```
With commands above, there will be created system links to the `.vimrc` and `.vim/`
of this repository in home and installed all the plugins.
If `.vimrc` and `.vim` were already present in home, they will be moved in a hidden
directory `.backup` in this repository.

To unset this vim configuration, just run
```
install.sh --uninstall
```
and the old configuration, if exists, will be moved back.

## Todo

- [ ] Make it work on Windows as well
