#!/bin/sh/
#TEEMUX MINECERAFT SERVER HELPER 2021
#by XTxiaoting14332
#Date2021.12.30T19:33
#Installer
#Let us start!
mir=hub.fastgit.org
#oh~
#languages
lang=no
raw=raw.fastgit.org
#file system
if [ -d /data/data/com.termux/files/usr/bin/ ]
then
file=/data/data/com.termux/files/usr/bin
else
file=/usr/bin
fi
#------;-;
if [ $lang = 1 ]
then
GUI='GUI edition'
com='Command-line edition'
cm='Change mirror'
sl='Set language'
wait='Please wait...'
done=Done.
gv='Get version info'
select=select:
getn='Download the latest version from github...'
ins='Installing package...'
mkf='making files...'
tipu='Please type [ sh mc-server.sh ]'
tipc='Please type [ mc-server -h ]'
dl=en-us
elif [ $lang = 2 ]
then
GUI=GUI版本
com='命令行版本'
cm='更换下载源'
sl='语言'
wait='请稍等...'
done=完成.
gv='正在获取最新版本信息'
select=选择
getn='从github获取软件包...'
ins='正在安装...'
mkf='创建文件...'
tipu='请输入 [ sh mc-server.sh ]'
tipc='请输入 [ mc-server -h ]'
dl=zh-hans
else
echo =========================
echo Language
echo
echo -----[1]English-----
echo
echo -----[2]简体中文------
echo
read -p select: la
case $la in
1)
sed -i 10clang=1 install.sh 
;;
2)
sed -i 10clang=2 install.sh
;;
*)
echo Unknown option.
;;
esac
fi
#function
a(){
sleep 0.1
}
ui(){
curl -sL api.github.com/repos/XTxiaoting14332/Termux-MCserver-helper/releases/latest > ver
sed -i 's/"name":/The latest version:/' ver && sed -i 's/,/ /' ver && sed -i 's/"/ /' ver && sed -i 's/"/ /' ver
sed -n 30p ver
sed -i 's/"tag_name":/ /' ver && sed -i 's/tag_name ://' ver && sed -i 's/[[:space:]]//g' ver && sed -i 's/"//g' ver
l=$(sed -n 28p ver)
}
cm(){
curl -sL api.github.com/repos/XTxiaoting14332/Termux-MCserver-helper-B/releases/latest > ver
sed -i 's/"name":/The latest version:/' ver && sed -i 's/,/ /' ver && sed -i 's/"/ /' ver && sed -i 's/"/ /' ver
sed -n 30p ver
sed -i 's/"tag_name":/ /' ver && sed -i 's/tag_name ://' ver && sed -i 's/[[:space:]]//g' ver && sed -i 's/"//g' ver
l=$(sed -n 28p ver)
}
clear
#execute
echo -e "+=========================+"
a 
echo -e "|.....____................|"
a 
echo -e "|.../.____.\..............|"
a 
echo -e "|.././////|.\.............|"
a
echo -e "|.|./___//|.|.TERMUX......|"
a
echo -e "|.|.|==@|/|...MC-SERVER...|"
a 
echo -e "|.|.|M_C|/|...HELPER......|"
a
echo -e "|.|.|==*|//./============.|"
a
echo -e "|.|.|___|/./.INSTALLER....|"
a 
echo -e "|. \______/...............|"
a 
echo -e "+=========================+"
echo
echo '==XT Termux MCserver helper installer=='
echo
echo by XTxiaoting14332
echo 
echo -----INSTALL-----
echo
echo -----[1]$GUI-----
echo
echo -----[2]$com-----
echo
echo -----[3]$cm-----
echo
echo -----[4]$sl-----
echo
echo -----[0]exit-----
echo
read -p $select a
case $a in
1)
echo $gv
ui
echo $wait
sleep 0.5
sleep 0.3
echo $getn
wget $mir/XTxiaoting14332/Termux-MCserver-helper/releases/download/${l}/mc-server.sh
rm ver
sleep 1
echo $mkf
mkdir ~/mcserver
mkdir ~/mcserver/lang
mkdir ~/mcserver/SERVER
mkdir ~/mcserver/j2
chmod +x mc-server.sh
echo $done
echo $tipu
;;
2)
echo $gv
cm
echo $wait
sleep 0.8
echo $getn
wget $mir/XTxiaoting14332/Termux-MCserver-helper-B/releases/download/${l}/mc-server
wget $raw/XTxiaoting14332/Termux-MCserver-helper/lang/${dl}.lang
rm ver
echo $ins
sleep 1
echo $mkf
sleep 0.5
mkdir ~/mcserver
mkdir ~/mcserver/j2
mkdir ~/mcserver/lang
mkdir ~/mcserver/SERVER
mv mc-server ${file}/
mv ${dl}.lang ~/mcserver/lang
chmod +x ${file}/mc-server
echo $done
mc-server -test
echo $tipc
;;
3)
echo =================
echo
echo --[1]github.com--
echo
echo --[2]hub.fastgit.org--
echo
echo =================
read -p $select ms
case $ms in
1)
sed -i 7cmir=github.com install.sh
sed -i 11craw=raw.github.com install.sh
;;
2)
sed -i 7cmir=hub.fastgit.org install.sh
sed -i 11craw=raw.fastgit.org install.sh
;;
esac
;;
4)
sed -i 10clang=none install.sh
sh install.sh
;;
*)
exit
;;
esac
