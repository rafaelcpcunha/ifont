@echo off
md %TEMP%\todas_fontes
set fontes=%TEMP%\todas_fontes
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts] > fontes.reg
set /p dir_user=Digite o diretorio das fontes.ENTER para %USERPROFILE%\Desktop\fontes  || Set dir_user=%USERPROFILE%\Desktop\fontes
xcopy %dir_user%\*.*tf %dir_user% /Y /S
copy %dir_user%\*.*tf %fontes%
for /F %%A in ('dir /b %fontes%') do (
copy %%A %systemroot%\fontes
echo "%%A"="%%A" >> fontes.reg
)
rem regedit /s fontes.reg
pause
goto destroi

:destroi
rem del fontes.reg
del /Q /F %fontes%
set nome=
set fontes=
set dir_user=
goto fim

:fim
