Most of the configurations are copied from qqshfox's legacy dotvim project.

Requires vim/mvim 8+.

Requires vim-plug.

Other requirements:

1. golang

2. python3

3. nodejs, npm


Make sure you have: cmake, python3, go, node installed with Homebrew.

Install

```bash
git clone https://github.com/sickate/dotvim ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install plugin（in vim）

```vim
:PlugInstall
```

after that, goto YouCompleteMe path and run: 

```bash
python3 install.py --clang-completer --go-completer --java-completer --js-completer
```

