@echo off
mode 60,25
set /a counter=0
title Christmas-Treasure.bat
:loop
for /f "delims=" %%i in ('christmas.bat 2^>NUL') do call :printme "%%i"
set /a counter=counter-1
cls&for /l %%i in (0,1,%counter%) do CALL echo: %%something[%%i]%%&if %%i==9 echo   %date%
set /a counter=0
goto :loop
:printme
set something[%counter%]=%1
CALL set something[%counter%]=%%something[%counter%]:^^=^^^^%%
CALL set something[%counter%]=%%something[%counter%]:^^=^^^^%%
CALL set something[%counter%]=%%something[%counter%]:"=%%
set /a counter+=1