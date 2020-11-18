#! /bin/bash

# 1.usefull tools

# install ack, text-grep, see more https://beyondgrep.com/install/
curl https://beyondgrep.com/ack-v3.0.0 > ~/bin/ack && chmod 0755 ~/bin/ack

# todo
# install jq, fd

# install cheat with Go
go get -u github.com/cheat/cheat/cmd/cheat

# 2.setting

# set conda mirror, see more https://tuna.moe/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes

# set pip mirror
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# set npm mirror
npm config set registry https://registry.npm.taobao.org

# set subl ln
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/bin/subl
ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code ~/bin/code

# set Homebrew-bottles, see more
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles' >> ~/.bash_profile
source ~/.bash_profile

# set Homebrew, see more https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/
cd "$(brew --repo)"
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

brew update

# sudo chown -R 501:20 "/Users/liyujian/.npm"
