#!/bin/bash
echo "
-----------------------------------------------------
termux 一键部署ncmdump.py jio本


ps:ncmdump.py是在gayhub上偷的~
嘤嘤嘤~ 作者：隔壁泰山
**********************************"

read -p "请回车安装依赖包..."
pkg install wget && pkg upgrade -y && pkg update -y && apt-get install clang -y && pip install pycryptodome mutagen && pkg install -y python
wget -N https://github.com/3207754367/ncmdump/raw/master/ncmdump.py
echo "依赖包安装完成"
read -p "请按回车键运行后台解密脚本:(定制ROM不要结束Termux哟~)"

while :
do
if [ -e /sdcard/netease/cloudmusic/Music/*.ncm ]; then
	#判断是否存在网易云ncm加密文件
	mv /sdcard/netease/cloudmusic/Music/*.ncm .
	#移动加密文件至解密脚本目录
	python ncmdump.py &&  mv -f *.flac *.mp3 /sdcard/Music && break
	#重定向解密文件至/sdcard/Music
	echo $a 已解密,文件已输出到目录：/sdcard/Music
	rm -rf *.ncm  #清理ncm加密文件
else
	echo "未找到ncm格式加密文件" >> /dev/null

fi
done
