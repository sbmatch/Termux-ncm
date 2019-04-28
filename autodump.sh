#!/bin/bash

#解密ncm
rundump (){
echo "正在解密ing..."
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
}
#主界面
 start-menu(){
 clear
 a="不知道，问就是爱的供养，再问自杀"
 echo -e "
${White}
**********古他妈黑暗之神 呼啦啦 解除***********
termux 一键部署ncmdump.py

ncmdump.py是在gayhub上偷的~

嘤嘤嘤~ 作者：隔壁泰山
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1.开始安装依赖包(如果是第一次运行)
2.启动解密脚本
3.退出脚本
**********************************

依赖包状态：${a}
"
#字体颜色
Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" &&  Blue_font_prefix="\033[36m" && White="\033[47;30m" && shan="\033[5;m"

read -p "请输入数字:" yn
 case $yn in
0)
	echo 你怎么回事？小老弟？??
	sleep 3
	start-menu
 	;;
1)
	dependency
        ;;
2)
	rundump
	;;
3)
	exit
	;;
*)
	echo -e "
	${Red_font_prefix}玩儿呢?! 请重新输入正确数字[🙃]"
	sleep 2 && start-menu
	;;
esac

}

#安装依赖包
dependency(){
	pkg install wget  && pkg install python && apt-get install clang -y && pip install --upgrade pip && pip install pycryptodome mutagen

 if [ -e ncmdump.py ]; then                                                      
 echo -e "${Blue_font_prefix}
 解密Python脚本已安装...
 正在运行解密脚本...
 小提示：
 Ctrl +c 即可结束本脚本
 "
rundump 
a="已安装依赖，可直接运行解密脚本"
else
 wget -N https://github.com/3207754367/ncmdump/raw/master/ncmdump.py && chmod +x ncmdump.py && read -p "${Blue_font_prefix}解密Python脚本已下载，请按回车键运行解密脚本(定制ROM不要结束Termux哟~)" && rundump
 fi
 }

start-menu
