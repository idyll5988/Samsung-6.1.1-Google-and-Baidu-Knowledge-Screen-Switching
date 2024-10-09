#!/system/bin/sh
(echo "\n  按下音量按钮\n   音量 + : 谷歌\n   音量 - : 百度\n";
while true;
do input="$(timeout 0.1 getevent -l|grep -Eo 'VOLUMEUP|VOLUMEDOWN'|head -n1)";
if [ "$input" = "VOLUMEUP" ];then 
echo "   已选定 : 谷歌\n";
su -c cmd settings put secure cn_support_circe_to_search 1
break;
elif [ "$input" = "VOLUMEDOWN" ];then 
echo "   已选定 : 百度\n";
su -c cmd settings put secure cn_support_circe_to_search 0
break;
fi;
done;)2>/dev/null
