#!/bin/bash

#字体颜色
Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" &&  Blue_font_prefix="\033[36m" && White="\033[47;30m" && Green_font_perfix="\033[32m" &&reset="\033[0m"

#解密ncm
rundump(){
echo -e "${Green_font_perfix}正在解密ing.${reset}"
#循环判断ncm文件路径
file1="/sdcard/netease/cloudmusic/Music"
file2="/sdcard/Music/netease"
file3="/sdcard/Android/data/com.netease.cloudmusic/sdcard/netease/cloudmusic/Music"

while true
do

if [ -d $file1 ]; then
	find $file1 -name "*.ncm" -exec mv {} . \; && python3 ncmdump.py $1 | sed -e '/please input file path!/d' && sleep 3 && rm -rf *.ncm
#移动加密文件进行解密
elif [ -d $file2 ]; then
	find $file2 -name "*.ncm" -exec mv {} . \; && python3 ncmdump.py $1 | sed -e '/please input file path!/d' && sleep 3 && rm -rf *.ncm 
elif [ -d $file3 ]; then
	find $file3 -name "*.ncm" -exec mv {} . \; && python3 ncmdump.py $1 | sed -e '/please input file path!/d' && sleep 3 && rm -rf *.ncm
else
	echo "没有找到ncm文件" >> /dev/null
fi
outfile 2>/dev/null #输出解密后的文件
done
}

#判断重定向的目录是否存在
if [ -d "/sdcard/Music/netease/" ] ;then
	mpath=/sdcard/Music/netease/
else
	mkdir /sdcard/Music/netease/
	mpath=/sdcard/Music/netease/
fi

#输出解密后的文件
outfile(){
	mv -f *.mp3 $mpath && echo "已解密,mp3文件已输出到目录：/sdcard/Music/netease" 
	mv -f *.flac $mpath && echo "已解密,flac文件已输出到目录：/sdcard/Music/netease"
 }

#主界面
 start-menu(){
 clear
 a="爱的供养，再问自杀"
 echo -e "
${Green_font_perfix}
******古他妈黑暗之神 呼啦啦 解除*****

termux 一键部署ncmdump.py
ncmdump.py是在gayhub上偷哒~
嘤嘤嘤~ 作者：隔壁泰山

1.开始安装依赖包(如果是第一次运行)
2.启动解密脚本
3.退出脚本

依赖包状态：${a}
${reset}"

read -p "请输入数字:" zero
 case $zero in
0)
	echo 你怎么回事？小老弟？??
	sleep 2
	start-menu
 	;;
1)
	dependency
        ;;
2)
	rundump
	;;
3)
	echo -e ${reset}
	echo 感谢使用，再见.
	exit
	;;
*)
	echo -e "${Red_font_prefix}请重新输入正确数字[(ㅎ.ㅎ)]${reset}"
	sleep 1 && start-menu
	;;
esac

}

#安装依赖包
dependency(){

[ ${release}="termux" ] && pkg install wget python  clang -y && pip install --upgrade pip && pip install pycryptodome mutagen pycryptodomex

[ ${release}="ubuntu" ] && apt install wget python3 clang python3-pip -y && pip3 install --upgrade pip && pip install pycryptodome mutagen pycryptodomex pycrypto && apt remove python3-pip -y > /dev/null

 if [ -e ncmdump.py ]; then
	 rundump
else
 wget -N https://github.com/3207754367/ncmdump/raw/master/ncmdump.py && chmod +x ncmdump.py && rundump

 fi
}


#检查系统
#代码借鉴自github：https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh
check_sys(){

	if cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="ubuntu"
        elif [ `pwd` = "/data/data/com.termux/files/home" ]; then
		release="termux"
    fi
}

check_sys
[[ ${release} != "termux" ]] && [[ ${release} != "ubuntu" ]]  && echo  "sorry,本脚本不支持当前系统!" && exit 1
start-menu
