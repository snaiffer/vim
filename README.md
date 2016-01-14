
Vim's settings with plugins.

## Instalation

```sh
$ sudo apt-get -y install vim git ctags clang libclang-dev
$ rm -Rf ~/.vim ~/.vimrc && git clone https://github.com/snaiffer/vim.git ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc && vim -c "BundleInstall" -c 'qa!'
```

### [Additionally:]
#### Generate tags for C/C++

```sh
$ cd /usr/include/
$ sudo ctags --extra=+q -R .
```
#### pyclewn --debugger for C and C++
Download the latest version
    http://pyclewn.sourceforge.net/index.html

```sh
$ tar xzf pyclewn*
$ cd pyclewn-1.11.py3
$ sudo EDITOR=/usr/bin/vim python setup.py install --force
```
