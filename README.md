[TOC]

# vimrc
参考以下配置：</br>
&#160; &#160; &#160; &#160;1）https://github.com/yangyangwithgnu/use_vim_as_ide</br>
&#160; &#160; &#160; &#160;2）https://github.com/amix/vimrc</br>
&#160; &#160; &#160; &#160;3）https://github.com/skywind3000/vim</br>
感谢以上配置仓库的作者！



# Vim使用效果
Vim启动：
<div align="center">
<img src="https://github.com/TitenWang/vimrc/blob/master/pics/startify.png" alt=""/><br />
</div>

Keymaps提示：
<div align="center">
<img src="https://github.com/TitenWang/vimrc/blob/master/pics/which_key.png" alt=""/><br />
</div>

YCM补全：
<div align="center">
<img src="https://github.com/TitenWang/vimrc/blob/master/pics/ycm_complete.png" alt=""/><br />
</div>

# Vim安装及配置
　　以下步骤中的操作，均假设在用户主目录下操作。
## Lua安装
### 0. 下载依赖库
```
sudo apt-get install libreadline7 libreadline-dev
```
### 1. 下载安装包
```
wget http://www.lua.org/ftp/lua-5.3.5.tar.gz
```
### 2. 安装lua
```
tar -zxvf lua-5.3.5.tar.gz
cd lua-5.3.5
make linux test
sudo make install
```
　　执行完上述步骤之后，可以在shell中键入lua来看是否安装成功。
# Vim安装
　　由于这份vim配置中的部分插件需要vim的版本在8.0以上，因此我们通过源码安装vim的最新版本。具体步骤如下：
### 0. 安装语言支持
```
sudo apt-get install python-dev python3-dev liblua5.3-dev libncurses5-dev
```
### 1. 安装git及配置
　　由于git不一定非要是最新版本，可以直接通过ubuntu的源进行安装，并进行简单配置，这里以我的github账号为例：
```
sudo apt-get install git
git config --global user.name TitenWang
git config --global user.email TitenWang2013@hotmail.com
```
### 2. 生成ssh key（可选）
　　由于我们经常需要从github上面下载一些仓库，因此为了后续的可能有的权限问题，我们可以生成ssh key并添加到github当中。</br>
　　首先在shell中生成ssh key，采用默认设置，执行如下命令，并一直回车，直到命令结束：
 ```
 ssh-keygen
 ```
 　　执行完上述命令之后，会在～/.ssh/目录下面生成两个文件id_rsa和id_rsa.pub，到github账号“Settings->SSH and GPG keys->SSH keys”中，点击“New SSH key”，填入title，然后将id_rsa.pub的文件内容添加到key中，并保存。
### 3. 源码安装vim
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
### 4. 安装系统工具
　　由于一些vim插件需要系统工具的支持，如ale需要clang（支持c/c++等）和flake8（支持python），vim-autoformat需要autopep8，因此在安装插件之前我们先将这些系统工具安装一下。
　　先安装一些操作起来简单的，如下：
```
sudo apt-get install ctags
sudo apt-get install build-essential cmake
sudo apt-get install silversearcher-ag
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
### 5. vim插件安装,
　　这个vim配置库中只包含了两个文件，一个是.vimrc，这个文件是vim的配置文件；另一个是.ycm_extra_conf.py，这个文件是YCM使用的，如何使用参考![YCM](https://github.com/Valloric/YouCompleteMe)。将这两个文件放置到用户主目录下即可。
#### 5.1 安装vim-plug
　　通过上面的步骤，我们已经安装好了vim，以及vim插件可能会用到的一些系统工具，我们现在要开始安装vim插件，来配置vim了。vim插件很多，这里采用了插件管理器vim-plug来管理插件。插件管理器vim-plug本身也是一个vim插件，在安装其他插件之前，我们需要先安装一下vim-plug。命令如下：
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
　　执行完上面这个命令之后，在～/.vim/autoload/目录下面能看到plug.vim，这个文件就是vim-plug了。到这里vim-plug就安装好了。关于这个插件的详细信息以及用法可以参考vim-plug的![github仓库](https://github.com/junegunn/vim-plug)。
#### 5.2 其他插件安装
　　安装完vim-plug，就可以开始安装其他插件了。本仓库的配置文件.vimrc里面已经添加好了所有需要安装的vim插件，因此在shell里面键入vim，打开vim，在vim里面输入命令“:PlugStatus”可以看到所有插件都处于未安装状态，再输入命令“:PlugInstall”开始安装插件列表的所有插件。这里可能需要几分钟的等待时间。后续我们可以通过“:PlugInstall”、“:PlugStatus”、“:PlugUpdate”来管理我们的插件。</br>
#### 5.3 YCM插件安装
　　上面这个步骤对几乎所有插件来说就算是安装完了，但是有一个插件例外，那就是YouCompleteMe。这个插件还需要如下的额外步骤，先安装一些依赖库：
```
sudo apt-get install libboost-all-dev
```
##### 5.3.1 简易安装法
　　建议安装法就是采用install.py脚本来直接安装，步骤如下：
```
cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer --go-completer
```
　　这里可能需要一段时间，等待即可。注意，--clang-completer需要先安装clang，由于我们上面已经安装了clang，这里就不同安装了，--go-completer需要先安装golang，golang的安装参考第4节部分。
#### 5.3.2 手动编译法
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
  
  
  
  
  
