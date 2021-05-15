echo Author: HUUTRUNG
@echo off
title Azure-Auto-Region

echo Download all files...
curl --silent -O https://raw.githubusercontent.com/TheDarkMythos/Ngrok-Exe/master/ngrok.exe 
curl --silent -O https://raw.githubusercontent.com/phamhuutrung/Azure_RDP/main/NGROK-CHECK.bat


echo Copy NGROK to System32...
copy ngrok.exe C:\Windows\System32 >nul

echo CONNECT NGROK AUTH TOKEN...
start NGROK.bat >nul


echo Check Region for NGROK...
curl -s ifconfig.me >ip.txt
set /p IP=<ip.txt
curl -s ipinfo.io/%IP%?token=52e07b22f25013 >full.txt
type full.txt | jq -r .country >region.txt
type full.txt | jq -r .city >location.txt
set /p LO=<location.txt
set /p RE=<region.txt
if %RE%==SG (start ngrok tcp --region ap 3389)


echo Finished!
NGROK-CHECK.bat
