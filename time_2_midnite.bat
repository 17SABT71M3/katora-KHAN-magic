@echo off

rem for /f %%i in ('wmic os get localdatetime^|findstr /r "[0-9]"') do set dates=%%i
for /f %%i in ("20240216215811.337000+330") do set dates=%%i



echo %dates%

set minutes=%dates:~10,1%
if %minutes%==0 (set /a minutes=%dates:~11,1%) else (set /a minutes=%dates:~10,2%)

set /a hour=%dates:~8,1%
if %hour%==0 (set /a hour=%dates:~9,1%) else (set /a hour=%dates:~8,2%)

set /a seconds=%dates:~12,1%
if %seconds%==0 (set /a seconds=%dates:~13,1%) else (set /a seconds=%dates:~12,2%)
echo BEGIN %hour% %minutes% %seconds%

set ms=%dates:~15,3%
(set Msz1=%ms:0,1%)
(set Msz2=%ms:1,1%)
if "%Msz1%"=="0" if "%msz2%"=="0" (set /a ms=%ms:~3%)
if "%Msz1%"=="0" if "%msz2%" NEQ "0" (set /a ms=%ms:~2%)
if "%Msz1%" NEQ "0" set /a ms=%ms%

if %ms% NEQ 0 (set /a totalms=1000-ms) else (set /a totalms=0)
:REACTION_AXD_COUNTER-REACTIONX
echo. !Bonnie!:` Milli Seconds bucket total + %totalms%

if %totalms% NEQ 0 set /a seconds=seconds+1
if %seconds%==60 set /a minutes=minutes+1
if %minutes%==60 set /a hour=hour+1

echo %hour% %minutes% %seconds%
:RESET_TIMES
if %minutes%==60 set /a minutes=0
if %seconds%==60 set /a seconds=0

echo _RESET%hour%:%minutes%:%seconds%

if %seconds% NEQ 0 (set /a totalsec=60-seconds) else (set /a totalsec=0)
echo. ^^Katora:` totalsec collected ^^:` %totalsec%
if %totalsec% NEQ 0 set /a minute=minute+1
if %minutes%==60 set /a hour=hour+1

echo %hour% %minutes% %seconds%

if %minutes%==60 set /a minutes=0

echo _RESET%hour%:%minutes%:%seconds%

if %minutes% NEQ 0 (set /a totalmin=60-minutes) else (set /a totalmin=0)
echo. ^^Katora:` totalmin collected ^^:` %totalmin%
if %totalmin% NEQ 0 set /a hour=hour+1

echo %hour% %minutes% %seconds%


echo: Katora Status:-+\o