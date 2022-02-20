#!/bin/bash
if grep "^PermitRootLogin"  /etc/ssh/sshd_config ; then
		sed -i 's+PermitRootLogin.*+PermitRootLogin\ yes+g' /etc/ssh/sshd_config
		else
		echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
		fi
		if grep "^PasswordAuthentication"  /etc/ssh/sshd_config ; then
		sed -i 's+PasswordAuthentication.*+PasswordAuthentication\ yes+g' /etc/ssh/sshd_config
		else
		echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
		fi
		
		clear
		echo "Mật Khẩu Cho root"
		passwd root
		service sshd restart
echo "Hoàn Thành Cài Đặt"

