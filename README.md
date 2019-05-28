<h1 align="center">VSCode配置指南</h1>

## 目录
- [插件列表](#插件列表)
- [插件配置](#插件配置)
- [部分插件说明](#部分插件说明)
  - [LaTeX-Workshop](#LaTeX-Workshop)


## 插件列表
　　目前在VSCode上安装的插件如下：
- VSCodeVim
- LaTeX Workshop
- LaTeX Snippets
- GitLens
- vscode-icons
- Prettier-Code formatter
- VSC Netease Music
- One Dark Pro
- LeetCode
- Go
- Bracket Pair Colorizer
- C/C++
- Beautify
- Markdown All in One
- Python
## 插件配置
　　VSCode的插件配置在~/.config/Code/User/settings.json文件中。VSCode的插件安装及其配置相较Vim来说比较简单，安装完上述插件后，
直接将库上的settings.json替换到上述路径下，重启VSCode。
## 部分插件说明
### LaTeX-Workshop
　　LaTeX Workshop需要配合后端的LaTeX编译器才能进行完整的工作。因此，需要安装TeXLive。这里选择安装当前的最新版本TeXLive 2019。安装
可以参考TeXLive的![官网](http://tug.org/texlive/acquire-netinstall.html)。步骤如下：
```
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -zxvf install-tl-unx.tar.gz
cd install-tl-20190525/
sudo ./install-tl
```
　　需要说明的是，install-tl-unx.tar.gz压缩包解压之后得到的文件是install-tl-20190525。默认情况下TeXLive是安装在/usr/local/texlive
目录下的。为了让VSCode可以找到LaTeX编译器，需要将/usr/local/texlive/2019/bin/x86_64-linux追加上系统变量PATH中，即将“export PATH=
$PATH:/usr/local/texlive/2019/bin/x86_64-linux”追加到/etc/profile文件中，然后执行“source /etc/profile”以让修改生效。
    
