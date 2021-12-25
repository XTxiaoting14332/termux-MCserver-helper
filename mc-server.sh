#/bin/sh
#Mc server helper by XTxiaoting14332
#DATE-2021-12-19 Sun. 14:33
clear
echo 检查文件完整性……
sleep 1
if [ ! -d SERVER ]
then
echo 正在创建主目录……
mkdir SERVER
fi
if [ ! -f SERVER/log4j2_112-116.xml ]
then
cd SERVER/
echo 检测到您未安装用于Minecraft1.12-1.16的java log4j补丁，准备安装……
sleep 0.5
wget https://launcher.mojang.com/v1/objects/02937d122c86ce73319ef9975b58896fc1b491d1/log4j2_112-116.xml
fi
if [ ! -f SERVER/log4j2_17-111.xml ]
then
cd SERVER/
echo 检测到您未安装用于Minecraft1.7-1.11的java log4j补丁，准备安装……
sleep 0.5
wget https://launcher.mojang.com/v1/objects/dd2b723346a8dcd48e7f4d245f6bf09e98db9696/log4j2_17-111.xml
fi
sleep 0.5
echo =======================
echo
sleep 0.1
echo -----[1]一键安装JAVA8-----
echo
sleep 0.1
echo -----[2]创建一个新的服务器------
echo
sleep 0.1
echo -----[3]关于------
echo
sleep 0.1
echo -----[4]编辑服务器[还没做好]------
echo
sleep 0.1
echo -----[5]快速启动服务器-----
echo
echo ====想和朋友一起van♂？来看看这个！====
sleep 0.1
echo -----[6]手机版花生壳超简单快速映射教程-----
echo
echo -----[0]退出脚本-----
echo
echo ============================
echo V1.0.0_beta
echo by @XTxiaoting14332
echo ============================
sleep 0.1

read -p ':' xz
case $xz in
0)
echo logout...
sleep 1
;;
1)
echo 请稍候
sleep 1
echo 正在安装proot
sleep 1
pkg install proot -y
sleep 1
echo 正在从github上获取JAVA8...
echo
sleep 0.5
echo about 约占用80M的储存空间
sleep 1
wget hub.fastgit.org/Hax4us/java/releases/download/v8/jdk8_aarch64.tar.gz
sleep 0.1
wget raw.fastgit.org/Hax4us/java/master/installjava
sleep 1
echo 完成，正在安装java运行环境
sh installjava
sleep 0.1
echo 给予权限......
chmod -R 777 /data/data/com.termux/files/usr/bin/java
sleep 1
java -version
sleep 3
echo 安装完成.
sh mc-server.sh
;;
2)
cd SERVER
read -p '请输入要创建的服务器名称:' create
mkdir $create
read -p '请输入服务端的绝对路径:' ser
echo 读取中……
if [ -f $ser ]
then
cd $create
mv $ser server.jar
echo 请输入对应数字：
echo 1.17及以上请输入1
echo 1.12-1.16请输入2
echo 1.7-1.11请输入3
echo 1.7以下输入4
read -p 请输入: num
echo 创建启动程序...
case $num in
1)
echo java -jar -Xms800M -Xmx1024M server.jar -Dlog4j2.formatMsgNoLookups=true nogui >> start-server.sh 
;;
2)
echo java -jar -Xms800M -Xmx1024M server.jar -Dlog4j.configurationFile=log4j2_112-116.xml nogui >> start-server.sh
;;
3)
echo java -jar -Xms800M -Xmx1024M server.jar -Dlog4j.configurationFile=log4j2_17-111.xml nogui >> start-server.sh
;;
4)
echo java -jar -Xms800M -Xmx1024M server.jar nogui >> start-server.sh
;;
esac
echo 正在给服务器安装java log4j补丁以保护您的设备安全
sleep 1
chmod -R 777 ./start-server.sh
sleep 2
echo 完成，准备第一次启动服务端以创建文件......
sleep 1
echo 当服务端停止运行时，将自动同意MOJANG的EULA协议.
sleep 0.1
echo 五秒后将启动服务端
sleep 0.2
echo 请稍候……
java -jar -Xms800M -Xmx1024M server.jar nogui
sleep 0.3
echo 首次运行初始化完成！
sleep 0.1
echo 正在自动同意mojang的eula协议……
echo '#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).
#Sat Dec 18 11:52:23 GMT 2021
eula=true' > eula.txt
sleep 1
echo 完成，您可在再次运行启动器时启动您的服务器！
else
cd ../
echo 'You d have this ser!'
sleep 2
sh mc-server.sh
fi
;;
3)
clear
echo '
MC server helper
mc服务器小助手

by XTxiaoting14332

V1.0.0[beta]'
read -n1 -p '按任意键返回' a
case $a in
*)
sh mc-server.sh
;;
esac
;;
null)
clear
sleep 0.5
echo Choose
ls SERVER/
read -p ':' s
cd $s
read -p player: '' a
sed -i 'nc' server.profile
;;
5)
echo 请选择一个服务器,或输入back返回上一级
ls SERVER/
read -p ':' c
case $c in
back)
sh mc-server.sh
;;
*)
cd SERVER
cd $c
sleep 0.3
echo 请稍候……
sh start-server.sh
;;
esac
;;
6)
echo '
花生壳手机版内网映射mc服务器教程:
应用商店搜索花生壳管理，下载后注册账号
点击创建隧道
内网主机写127.0.0.1
端口填25565
其他不用管，点击创建
创建成功后，在主页可看见你的映射，点击小开关开启你的映射
点击你映射那一栏的编辑按钮，进入编辑状态后复制外网域名那一栏，接着点左上角返回
然后启动服务器，在游戏中粘贴你所复制的地址即可进入游戏！
'
;;
*)
sh mc-server.sh
;;
esac
