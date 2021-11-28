# Xcode インストール
Mac App Store等でインストールします。  
以下のコマンドが必要かも  
```
sudo xcodebuild -license
```

# Homebrewのインストール
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
最新版かどうか一応調べる

# gitのインストール
基本はcaskでインストールするけど、gitだけは先に落としておく
```sh
$ brew install git
$ git config --global user.name "waterlow"
$ git config --global user.email waterlow3442@gmail.com
```
公開鍵登録  
```
ssh-keygen -t rsa -C "waterlow3442@gmail.com"
cat ~/.ssh/id_rsa.pub
```
githubのページで登録する
# dotfilesのインストール
https://github.com/skwp/dotfiles

# brewcaskでアプリのインストール
```sh
brew tap homebrew/boneyard
cd Documents
git clone git@github.com:waterlow/homebrew-cask-brewfile.git
```

# `zshrc`に以下を追加
```sh
# change prompt
prompt kylewest

# for rbenv
# http://morizyun.github.io/blog/marvericks-rails-setup-ruby-rvm-msyql/
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function gem(){
  $HOME/.rbenv/shims/gem $*
  if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
  then
    rbenv rehash
  fi
}

function bundle(){
  $HOME/.rbenv/shims/bundle $*
  if [ "$1" = "install" ] || [ "$1" = "update" ]
  then
    rbenv rehash
  fi
}

export PATH="$HOME/.rbenv/shims:$PATH"

```
