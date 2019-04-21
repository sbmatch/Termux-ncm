#!/bin/bash
echo "
-----------------------------------------------------
termux 一键部署ncmdump.py jio本


ps:ncmdump.py是在gayhub上偷的~
嘤嘤嘤~ 作者：隔壁泰山
**********************************"

read -p "请回车安装依赖包..."
pkg install wget && pkg upgrade -y && pkg update -y  && pkg install  python && apt-get install clang -y && pip install --upgrade pip && pip install pycryptodome mutagen

if [ -e ncmdump.py ]; then
	echo "
	ncmdump.py 已安装"
else
	wget -N https://github.com/3207754367/ncmdump/raw/master/ncmdump.py && chmod +x ncmdump.py
	
fi
	echo "依赖包安装完成"
	read -p "请按回车键运行后台解密脚本:(定制ROM不要结束Termux哟~)"

echo "
正在解密ing..."
while :
do
if [ -e /sdcard/netease/cloudmusic/Music/*.ncm ]; 
then
	#判断是否存在网易云ncm加密文件
	mv /sdcard/netease/cloudmusic/Music/*.ncm .
	#移动加密文件至解密脚本目录
	python ncmdump.py && echo  "已解密,文件已输出到目录：/sdcard/Music" && rm -rf *.ncm
elif [ -e /sdcard/music/netease/*.ncm ] ;
then
        mv /sdcard/music/netease/*.ncm .
        #移动加密文件至解密脚本目录
        python ncmdump.py && echo "已解密,文件已输出到目录：/sdcard/Music/netease" && rm -rf *.ncm
elif [ -e /sdcard/Android/data/com.netease.cloudmusic/sdcard/netease/cloudmusic/music/*.ncm ] ;
then   
	mv /sdcard/Android/data/com.netease.cloudmusic/sdcard/netease/cloudmusic/music/*.ncm . 
	#移动加密文件至解密脚本目录
        python ncmdump.py && echo "已解密,文件已输出到目录：/sdcard/Music/netease" && rm -rf *.ncm
else
	echo "没有找到ncm文件" >> /dev/null
fi

#输出解密后的文件
a="*.mp3"
b="*.flac"
if [ -f $a ];then                                                           
	 mv -f $a /sdcard/music/netease 

 elif [ -f $b ];then
	 mv -f $b /sdcard/music/netease

else
echo "" >>/dev/null	 
fi

done
