#!/bin/bash
echo -e "\033[36m==========================================================================\033[0m"
echo -e "                    \033[36m 欢迎使用一键搭建雷达4.30(Centos6+) \033[0m"  
echo -e "                         \033[32m   Qq：1264527381 \033[0m" 
echo -e "                      \033[36m 	1.修改了默认物品显示,免去每次选择 \033[0m"
echo -e "                      \033[36m 	2.固定FPS30,免去每次选择 \033[0m"
echo -e "                      \033[36m 	3.修复了车辆跟随并加上了敌人开车看不见的bug \033[0m"
echo -e "                      \033[36m 	4.内部版完全修复了车辆跟随，增加了队友视角追随! \033[0m"
echo -e "                      \033[36m 	5.加入了战斗模式! \033[0m"
echo -e "                             \033[36m All Rights Reserved \033[0m"  
echo -e	""
echo -e "                                         \033[35m By XiNian(昔年)  2018-05-02\033[0m"                                                  
echo -e "\033[36m==========================================================================\033[0m"

echo -e "---------- \033[33m 防止机器，请输入'\033[47;34m 1264527381 \033[0m'来继续下一步 \033[0m ---------- "
read -p "请输入:" pz
is_pz='1264527381'
if [ $pz != $is_pz ];
	then
    echo -e "\033[5;34m 验证失败 请联系Qq：1264527381 \033[0m"  
    exit
fi
echo -e "\033[5;34m 正在获取公网IP..." " \033[0m" 
curl ip.cn
echo -e "\033[5;34m 内网IP:" "\033[0m"  && /sbin/ifconfig -a |grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'
echo "请输入你的内网ip" 
read -p "内网ip： " ip
echo "$ip"

yum -y install git


wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

echo "SSR搭建已经完成,请记住连接信息。^_^"
echo ""
read -p "按任意键继续......."

curl https://raw.githubusercontent.com/creationix/nvm/v0.13.1/install.sh | bash
source ~/.bash_profile
nvm install v9.8.0
nvm alias default v9.8.0
yum -y install gcc-c++
yum -y install flex
yum -y install bison
wget http://www.tcpdump.org/release/libpcap-1.8.1.tar.gz
tar -zxvf libpcap-1.8.1.tar.gz
cd libpcap-1.8.1
./configure
make
make install

wget http://9911ka.cn/XiNian/PUBG-XiNian-0502.tar
tar -xvf  PUBG-XiNian-0502.tar
cd PUBG-XiNian-0502/ 
npm i 
npm i -g pino 
npm install -g forever 
forever start index.js sniff eth0 $ip | pino 

echo -e ""
echo -e "\033[36m==========================================================================\033[0m"
echo -e ""
echo -e "\033[36m                  搭建完成,请开始你的表演！如有BUG联系Qq：1264527381\033[0m"
echo -e ""
echo -e "\033[36m                  地图观看地址：公网IP:2018\033[0m"
echo -e ""
echo -e "雷达网页打不开，不跟踪，运行此命令 cd /root/libpcap-1.8.1/PUBG-XiNian-0502;. restart.sh"
echo -e "\033[36m==========================================================================\033[0m"
echo "";
