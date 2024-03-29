# 使用本脚本之前应保证./RunningManageServer服务是已经在线的状态。
# 即手动执行过nohup ./RunningManageServer >/dev/null 2>&1 &
RED_COLOR='\E[1;31m'  #红
GREEN_COLOR='\E[1;32m' #绿
YELOW_COLOR='\E[1;33m' #黄
BLUE_COLOR='\E[1;34m'  #蓝
PINK='\E[1;35m'      #粉红
RES='\E[0m'

echo -e  "${GREEN_COLOR}****Go服务启动程序>.<****${RES}\n\n"


echo -e "${YELOW_COLOR}---step1:拉取代码---${RES}"
git pull origin master
echo -e "${BLUE_COLOR}拉取代码成功${RES}\n"

echo -e "${YELOW_COLOR}---step2:编译---${RES}"
go build -o RunningManageServer
echo -e "${BLUE_COLOR}编译完成${RES}\n"

echo -e "${YELOW_COLOR}---step3:更改权限---${RES}"
chmod -R 777 RunningManageServer
echo -e "${BLUE_COLOR}更改权限完成${RES}\n"

echo -e "${YELOW_COLOR}---step4:杀掉进程并且运行---${RES}"
i1=`ps -ef|grep -E "RunningManageServer"|grep -v grep|awk '{print $2}'`
echo -e "${BLUE_COLOR}杀掉进程$i1${RES}\n"
kill -9 $i1 && nohup ./RunningManageServer >/dev/null 2>&1 &
i2=`ps -ef|grep -E "RunningManageServer"|grep -v grep|awk '{print $2}'`
echo -e "${GREEN_COLOR}****部署成功,部署的进程ID为:$i2${RES}****"

