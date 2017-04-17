# Vim

My vim configurations

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
* **git** for plugin management and other plugin (fugitive, vim-gitgutter)
* **exuberant-ctags** to provide a outline sidebar
* **npm** and **nodejs** installed for **javascript** completion (as newer version of these
is preferable, as with older versions *tern* fails to install)
* **jdk-8** for **java** completion
* **clang** for **c-family language** completion
