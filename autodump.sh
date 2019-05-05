#!/bin/bash

#字体颜色
Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" &&  Blue_font_prefix="\033[36m" && White="\033[47;30m" && Green_font_perfix="\033[32m" &&reset="\033[0m"

#解密ncm
rundump (){
echo -e "${Green_font_perfix}
正在解密ing...
(●＾皿＾●)
告诉你个秘密，李信出6个极寒能变成韩信
(￣y▽￣)~*
######################################################
哈哈哈，哈哈哈哈，现在终于是我古拉拉黑暗之神的天下啦！
哈哈哈，哈哈哈哈，哈哈哈哈哈，咳咳咳
(=￣ω￣=)${reset}
"
#循环判断ncm文件是否存在
while :
do
if [ -e "/sdcard/netease/cloudmusic/Music/*.ncm" ]; 
then
	#判断是否存在网易云ncm加密文件
	mv /sdcard/netease/cloudmusic/Music/*.ncm .
	#移动加密文件至解密脚本目录
	python ncmdump.py && echo  "已解密,文件已输出到目录：/sdcard/Music" && rm -rf *.ncm
elif [ -e "/sdcard/music/netease/*.ncm" ] ;
then
        mv /sdcard/music/netease/*.ncm .
        #移动加密文件至解密脚本目录
        python ncmdump.py && echo "已解密,文件已输出到目录：/sdcard/Music/netease" && rm -rf *.ncm
elif [ -e "/sdcard/Android/data/com.netease.cloudmusic/sdcard/netease/cloudmusic/music/*.ncm" ] ;
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
fi

done

}
#主界面
 start-menu(){
 clear
 a="爱的供养，再问自杀"
 echo -e "
${Green_font_perfix}
**********古他妈黑暗之神 呼啦啦 解除***********

termux 一键部署ncmdump.py

ncmdump.py是在gayhub上偷哒~

嘤嘤嘤~ 作者：隔壁泰山

1.开始安装依赖包(如果是第一次运行)
2.启动解密脚本
3.退出脚本
**********************************

依赖包状态：${a}
${reset}"

read -p "请输入数字:" yn
 case $yn in
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
	pkg install wget  && pkg install python && apt-get install clang -y && pip install --upgrade pip && pip install pycryptodome mutagen

 if [ -e ncmdump.py ]; then
	 rundump
else
 wget -N https://github.com/3207754367/ncmdump/raw/master/ncmdump.py && chmod +x ncmdump.py && read -p echo -e "
 ${Blue_font_prefix}
 解密Python脚本已安装...                                                     正在运行解密脚本...                                                         小提示：                                                                    Ctrl +c 即可结束本脚本${reset}
 " && rundump
 fi
 }

start-menu
