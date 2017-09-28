#!/bin/bash
which git;
a=$?;
which curl;
b=$?;
if [ $a -eq 0 ] && [ $b -eq 0  ]; then
	echo "OK, everything done!";
elif [ $a -eq 0 ] && [ $b -ne 0 ]; then
	echo "Sorry, curl is not installed. I install curl first.";
	sleep 2;
	sudo apt update;
	sudo apt install curl;
elif [ $a -ne 0 ] && [ $b -eq 0 ]; then
	echo "Sorry, git is not installed. I will install git first."
	sleep 2;
	sudo apt update;
	sudo apt install git;
else
	echo "Both git and curl are not installed. I install them first.";
	sleep 3;
	sudo apt update;
	sudo apt install git;
	sudo apt install curl;
fi
echo "Begin configuring Vim......"
sleep 2;

git clone https://github.com/ucasFL/my_vimrc.git;
sudo cp my_vimrc/vimrc /etc/vim;
mkdir -p ~/.vim/autoload ~/.vim/bundle;
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;
sudo mv my_vimrc/colors ~/.vim/;
sudo rm -r my_vimrc;
mkdir -p ~/.vim/autoload ~/.vim/bundle;
cd ~/.vim/bundle;
git clone https://github.com/jiangmiao/auto-pairs.git;
git clone https://github.com/scrooloose/nerdcommenter.git;
git clone https://github.com/scrooloose/nerdtree.git;
git clone https://github.com/ervandew/supertab.git;
git clone https://github.com/vim-syntastic/syntastic.git;
git clone https://github.com/majutsushi/tagbar.git;
git clone https://github.com/Lokaltog/vim-powerline.git;
git clone https://github.com/drmingdrmer/xptemplate.git;
git clone https://github.com/kien/ctrlp.vim.git;
git clone https://github.com/unblevable/quick-scope.git;
echo "Configuring Vim completed! Enjoying your Vim."
