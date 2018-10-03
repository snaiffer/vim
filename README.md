
Vim's settings with plugins.

## Instalation

```sh
$ sudo apt-get -y install vim git
$ rm -Rf ~/.vim ~/.vimrc && git clone https://github.com/snaiffer/vim.git ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc && vim -c "BundleInstall" -c 'qa!'
```

### [Additionally:]

#### Copy/Paste via SSH

https://defuse.ca/blog/clipboard-over-ssh-with-vim.html
https://stackoverflow.com/questions/5240473/in-vim-with-xclip-yank-to-clipboard

* First install xclip on both your local machine and the server:
apt-get install xclip

* Next, enable X11 forwarding on the server. Add the following to /etc/ssh/sshd_config:
X11Forwarding yes

* Auto-use forwarding on client. Add the following to ~/.ssh/config:
ForwardX11 yes

** Check. 
*** Connect to server:
echo $DISPLAY
Output shouldn't be empty
*** On server:
echo "hi" | xclip -i -selection clipboard
On client "hi" should be in exchange buffer.

* On server add to ~/.vimrc:
vmap <C-C> "yy <Bar> :call system('xclip -selection clipboard', @y)<CR>
map <C-V> :r!xclip -o -selection clipboard

#### clang

$ sudo apt-get install clang libclang-dev

#### Generate tags for C/C++

$ sudo apt-get install ctags

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
