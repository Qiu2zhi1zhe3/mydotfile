#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

cur_dir=$(pwd)

# check root
[[ $EUID -ne 0 ]] && echo -e "  lỗi：phải sử dụng quyền root để chạy tập lệnh này！\n" && exit 1

# check os
if [[ -f /etc/redhat-release ]]; then
    release="centos"
elif cat /etc/issue | grep -Eqi "debian"; then
    release="debian"
elif cat /etc/issue | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
elif cat /proc/version | grep -Eqi "debian"; then
    release="debian"
elif cat /proc/version | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
elif cat /proc/version | grep -Eqi "android"; then
    release="android"    
else
    echo -e "  không phát hiện ra phiên bản hệ thống, vui lòng liên hệ với tác giả tập lệnh！${plain}\n" && exit 1
fi

arch=$(arch)

if [[ $arch == "x86_64" || $arch == "x64" || $arch == "amd64" ]]; then
  arch="amd64"
elif [[ $arch == "aarch64" || $arch == "arm64" ]]; then
  arch="arm64"
else
  arch="amd64"
  echo -e "  Không phát hiện được kiến trúc, hãy sử dụng kiến trúc mặc định: ${arch}${plain}"
fi

echo "Ngành kiến trúc: ${arch}"

if [ $(getconf WORD_BIT) != '32' ] && [ $(getconf LONG_BIT) != '64' ] ; then
    echo "  Phần mềm này không hỗ trợ hệ thống 32-bit (x86), vui lòng sử dụng hệ thống 64-bit (x86_64), nếu phát hiện sai, vui lòng liên hệ với tác giả"
    exit -1
fi



install_base() {
    if [[ x"${release}" == x"centos" ]]; then
    	yum update && yum upgrade -y
        yum install wget curl tar git zsh vim -y    
    else
    	apt update && apt upgrade -y
        apt install wget curl tar git zsh vim sudo -y
    fi
}
install_mydotfile() {
    cd $HOME
	git clone https://github.com/Qiu2zhi1zhe3/mydotfile
	cp -r ./mydotfile/. .
	rm -rf $HOME/.git $HOME/README.md $HOME/install.sh 	$HOME/mydotfile
	chmod -R 755 $HOME/.local
}
setup() {
    if [[ x"${release}" == x"android" ]]; then
		chsh -s zsh
    else
    	sed -i 's+required+sufficient+g' /etc/pam.d/chsh
		chsh -s /bin/zsh
		sed -i 's+.*PermitRootLogin.*+PermitRootLogin\ yes+g' /etc/ssh/sshd_config
		sed -i 's+.*PasswordAuthentication.*+PasswordAuthentication\ yes+g' /etc/ssh/sshd_config
		passwd root
		service sshd restart
    fi
}
install_base
install_mydotfile
setup

