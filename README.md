
<h1 align="center">Vim安装及使用指南</h1>

## 目录
- [Vim使用效果](#Vim使用效果)
- [Vim安装及配置](#Vim安装及配置)
    - [Lua安装](#Lua安装)
        - [下载依赖库](#下载依赖库)
        - [下载安装包](#下载安装包)
        - [安装lua](#安装lua)
    - [Vim安装](#Vim安装)
        - [安装语言支持](#安装语言支持)
        - [安装git及配置](#安装git及配置)
        - [生成ssh key](#生成ssh-key)
        - [源码安装vim](#源码安装vim)
        - [安装系统工具](#安装系统工具)
        - [vim插件安装](#vim插件安装)
            - [安装vim-plug](#安装vim-plug)
            - [其他插件安装](#其他插件安装)
            - [YCM插件安装](#YCM插件安装)
                - [简易安装法](#简易安装法)
                - [手动编译法](#手动编译法)
- [部分插件注意事项](#部分插件注意事项)
    - [vim-gutentags](#vim-gutentags)
    - [YCM](#YCM)
    - [vim-airline](#vim-airline)
    - [ale](#ale)
    - [LeaderF](#LeaderF)
    - [ctrlsf](#ctrlsf)
- [致谢](#致谢)

## Vim使用效果
Vim启动：
<div align="center">
<img src="https://github.com/TitenWang/vimrc/blob/master/pics/startify.png" alt=""/><br /><br />
</div>

Keymaps提示：
<div align="center">
<img src="https://github.com/TitenWang/vimrc/blob/master/pics/which_key.png" alt=""/><br /><br />
</div>

YCM补全：
<div align="center">
<img src="https://github.com/TitenWang/vimrc/blob/master/pics/ycm_complete.png" alt=""/><br /><br />
</div>

## Vim安装及配置
　　以下步骤中的操作，均假设在用户主目录下操作。
### Lua安装
#### 下载依赖库
```
sudo apt-get install libreadline7 libreadline-dev
```
#### 下载安装包
```
wget http://www.lua.org/ftp/lua-5.3.5.tar.gz
```
#### 安装lua
```
tar -zxvf lua-5.3.5.tar.gz
cd lua-5.3.5
make linux test
sudo make install
```
　　执行完上述步骤之后，可以在shell中键入lua来看是否安装成功。
### Vim安装
　　由于这份vim配置中的部分插件需要vim的版本在8.0以上，因此我们通过源码安装vim的最新版本。具体步骤如下：
#### 安装语言支持
```
sudo apt-get install python-dev python3-dev liblua5.3-dev libncurses5-dev
```
#### 安装git及配置
　　由于git不一定非要是最新版本，可以直接通过ubuntu的源进行安装，并进行简单配置，这里以我的github账号为例：
```
sudo apt-get install git
git config --global user.name TitenWang
git config --global user.email TitenWang2013@hotmail.com
```
#### 生成ssh key
　　由于我们经常需要从github上面下载一些仓库，因此为了后续的可能有的权限问题，我们可以生成ssh key并添加到github当中。</br>
　　首先在shell中生成ssh key，采用默认设置，执行如下命令，并一直回车，直到命令结束：
 ```
 ssh-keygen
 ```
 　　执行完上述命令之后，会在～/.ssh/目录下面生成两个文件id_rsa和id_rsa.pub，到github账号“Settings->SSH and GPG keys->SSH keys”中，点击“New SSH key”，填入title，然后将id_rsa.pub的文件内容添加到key中，并保存。
#### 源码安装vim
　　由于Ubuntu自带的或者安装源中的vim版本不一定是最新的，因此我们通过源码来安装最新版本的vim。步骤如下：
```
git clone git@github.com:vim/vim.git
cd vim/ 
./configure --with-features=huge --enable-python3interp --enable-pythoninterp
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ --enable-rubyinterp 
    --enable-luainterp --enable-perlinterp 
    --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/  
     --enable-multibyte --enable-cscope      --prefix=/usr/local/vim/
make
sudo make install
```
　　在上面的configure步骤中，添加了lua和python、python3的一些功能配置，这是因为有些插件需要这些语言的支持。需要说明的是，--with-python3-config-dir和--with-python-config-dir这两个配置选项需要根据目标机器的情况而定，--prefix指定vim的安装路径。</br>
　　由于我们自己指定了vim的安装路径，因此我们需要将vim的路径添加到系统变量PATH，这样才能便于我们操作，有三种方法，分别如下：
- 将“export PATH=$PATH:/usr/local/vim/bin”追加到/etc/profile。
- 将“export PATH=$PATH:/usr/local/vim/bin”追加到～/.profile。
- 将“export PATH=$PATH:/usr/local/vim/bin”追加到~/.bashrc。</br>
上述方法选一种即可，追加完之后记得执行source，以让修改生效。接着我们可以在shell中输入“vim --version”来看我们的安装结果，检查是否有“+python3”和“+lua”，如果有的话，说明安装符合我们的预期。
#### 安装系统工具
　　由于一些vim插件需要系统工具的支持，如ale需要clang（支持c/c++等）和flake8（支持python），vim-autoformat需要autopep8，因此在安装插件之前我们先将这些系统工具安装一下。</br>
　　先安装一些操作起来简单的，如下：
```
sudo apt-get install ctags
sudo apt-get install build-essential cmake
sudo apt-get install silversearcher-ag
sudo apt-get install ripgrep
sudo apt-get install python3-pip
pip3 install flake8
pip3 install autopep8
```
　　接着安装一个重量级工具--clang。对于clang的安装，我们可以到![llvm官网](http://releases.llvm.org/download.html)下载对应目标机器的预编译版本。以Ubuntu18.04为例，执行如下命令：
```
wget http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
xz -d clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
tar -xvf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar
cd clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
sudo cp -r * /usr/local 
```
　　这样我们就将clang的预编译版本安装到了/usr/local目录下了。一般来说，/usr/local/bin目录已经在系统变量PATH中了，因此这里就不需要修改PATH了。</br>
　　如果需要使用vim-go来写golang的话，那么还需要安装下golang，这个可以参考golang官方的![安装指南](https://golang.google.cn/doc/install)以及![添加GOPATH](https://golang.google.cn/doc/code.html)等。
#### vim插件安装
　　这个vim配置库中只包含了两个文件，一个是.vimrc，这个文件是vim的配置文件；另一个是.ycm_extra_conf.py，这个文件是YCM使用的，如何使用参考![YCM](https://github.com/Valloric/YouCompleteMe)。将这两个文件放置到用户主目录下即可。
##### 安装vim-plug
　　通过上面的步骤，我们已经安装好了vim，以及vim插件可能会用到的一些系统工具，我们现在要开始安装vim插件，来配置vim了。vim插件很多，这里采用了插件管理器vim-plug来管理插件。插件管理器vim-plug本身也是一个vim插件，在安装其他插件之前，我们需要先安装一下vim-plug。命令如下：
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
　　执行完上面这个命令之后，在～/.vim/autoload/目录下面能看到plug.vim，这个文件就是vim-plug了。到这里vim-plug就安装好了。关于这个插件的详细信息以及用法可以参考vim-plug的![github仓库](https://github.com/junegunn/vim-plug)。
##### 其他插件安装
　　安装完vim-plug，就可以开始安装其他插件了。本仓库的配置文件.vimrc里面已经添加好了所有需要安装的vim插件，因此在shell里面键入vim，打开vim，在vim里面输入命令“:PlugStatus”可以看到所有插件都处于未安装状态，再输入命令“:PlugInstall”开始安装插件列表的所有插件。这里可能需要几分钟的等待时间。后续我们可以通过“:PlugInstall”、“:PlugStatus”、“:PlugUpdate”来管理我们的插件。</br>
##### YCM插件安装
　　上面这个步骤对几乎所有插件来说就算是安装完了，但是有一个插件例外，那就是YouCompleteMe。这个插件还需要如下的额外步骤，先安装一些依赖库：
```
sudo apt-get install libboost-all-dev
```
###### 简易安装法
　　建议安装法就是采用install.py脚本来直接安装，步骤如下：
```
cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer --go-completer
```
　　这里可能需要一段时间，等待即可。注意，--clang-completer需要先安装clang，由于我们上面已经安装了clang，这里就不同安装了，--go-completer需要先安装golang，golang的安装参考第4节部分。
###### 手动编译法
　　如果上面的简易安装法安装之后ycm不能实现其预期功能，那么可以尝试采用手动编译，步骤如下：
```
mv clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04 clang+llvm
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DPATH_TO_LLVM_ROOT=~/clang+llvm/ . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core
```
　　通过上面的两种方法，安装完之后，在~/.vim/plugged/YouCompleteMe/third_party/ycmd目录下会有一个ycm_core.so文件。接着可以在vim试试ycm的强大补全能力。</br>
　　到这里，vim及其插件的安装就差不多结束了，由于配置已经存在，直接使用即可。如果需要修改配置，修改.vimrc即可。
## 部分插件注意事项
### vim-gutentags
　　vim-gutentags插件需要靠在.vimrc中定义的g:gutentags_project_root中的标志来判断文件所在的工程，如果一个文件没有隶属于一个工程的话，gutentags就不会为该野文件生成tags。基于这样的原理，对于一些单个文件或者几个文件来说，我们可以在这些文件所在的文件夹内创建一个空的文件，文件名字为.root，这样的话，vim-gutentags就会为这个文件夹内的文件生成tags了。
### YCM
　　YCM插件需要一个额外的配置文件.ycm_extra_conf.py，这个文件基本不需要改动，但是如果在这个文件的flags中添加了一个机器相关的目录，那么在不同的机器上面可能就需要做一些修改，截取部分flags，说明如下：
```
flags = [
    ...
    '-isystem',
    '/usr/include/',
    '-isystem',
    '/usr/local/include',
    '-isystem',
    '/usr/include/x86_64-linux-gnu/c++/7',
    '-isystem',
    '/usr/local/include/c++/v1',
]
```
　　flags中省略的那部分关注度不高，主要是'-isystem'以及其后面紧跟着的路径，上述代码中的最后四行，可能会因机器差异而不同，也可以在这个基础上添加其他头文件所在路径。</br>
　　另外，YCM的标签引擎如果开启的话，可以为其添加你所需要补全的头文件对应的tag。在.vimrc文件中有如下三行相关配置：
```
let g:ycm_collect_identifiers_from_tags_files=1
set tags+=~/.cache/tags/stdcpp.tags
set tags+=~/.cache/tags/stdcppv1.tags
```
　　这种情况之下，我们可以利用ctags工具来生成对应头文件的tag，以c++标准库头文件为例，进入目录/usr/include/c++/7，然后执行如下命令：
```
sudo ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++ *
```
　　上述命令执行完之后，会在当前目录下生成文件tags，为了和vim-gutentags插件保持一致，可以将该文件tags重命名（防止冲突）后放入~/.cache/tags目录下，然后如上进行配置。
### vim-airline
　　vim-airline安装完后初次打开，vim状态栏可能会出现乱码和部分符号不能正常显示（状态栏箭头不显示）等问题。这种情况一般是编码和字体设置引起的，我们所使用的字体没有 airline 配置的符号，因此airline状态栏上无法正常显示图标和三角形箭头符号。可以下载使用powerline打过补丁的字体，详细信息可以参考![powerline fonts仓库](https://github.com/powerline/fonts)。Ubuntu下面安装过程简单，如下：
```https://github.com/powerline/fonts
sudo apt-get install fonts-powerline
```
### ale
　　ale插件在进行静态检查时，需要对应语言的工具来提供支持，例如配置文件中做了如下配置：
```
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck'],
\   'c++': ['clang'],
\   'c': ['clang']
\}
```
　　从上述配置可以看出，我们将c/c++的静态检查交由clang，python的静态检查交由flake8，那么我们就需要安装clang和flake8。这两个的安装方法在前面有说过，如果是按照上述步骤来的话，这里可以不用再操作。
### LeaderF
　　LeaderF rg子命令在进行查找时，需要借助工具rg，因此，如果需要使用LeaderF rg子命令的话，需要安装该工具。我们可以从Ubuntu安装源中进行下载安装，不过不一定是新版本，rg的安装方法在[安装系统工具](#安装系统工具)这一节已有描述，可以参考。

### ctrlsf
　　这个插件的功能和LeaderF rg子命令的功能类似，如果目标机器上面没有安装rg，而安装了ag的话，那么可以用ctrlsf.vim来替代LeaderF rg子命令。工具ag会被ctrlsf.vim作为后台搜索的工具，因此如果要使用ctrlsf.vim的话，需要安装ag。ag的安装方法在[安装系统工具](#安装系统工具)这一节已有描述，可以参考。
 
  
## 致谢
参考以下配置：</br>
&#160; &#160; &#160; &#160;1）https://github.com/yangyangwithgnu/use_vim_as_ide</br>
&#160; &#160; &#160; &#160;2）https://github.com/amix/vimrc</br>
&#160; &#160; &#160; &#160;3）https://github.com/skywind3000/vim</br>
感谢以上配置仓库的作者！



