:: OEM 866
@echo off
reg query "HKU\S-1-5-19">nul 2>&1 && set /a isAdmin=1 || set /a isAdmin=0
if %isAdmin%==0 (
    echo ����室��� ����᪠�� � �ࠢ��� �����������!
    goto exit
)

cd /d %programfiles%
set /a ex=0

<nul set /p str="���� ��४�ਨ MikTeX...               "
if exist Miktex* (
    goto search
) else (
    echo [������]
    echo ��४��� �� �������. ��室...
    goto exit
)

:search
for /f "delims=" %%i in ('dir /ad /b ^^ findstr /r "MikTeX*"') do set mp=%programfiles%\%%i
set hedd=%mp%\tex\latex\hed
echo [������]

if exist "%hedd%" (
    echo ��४��� HEd �������
    set /a ex=1
    <nul set /p str="�������� ��ன ���ᨨ...                "
    del /f /q "%hedd%\" > nul
    echo [������]
    goto copy
) else (
    <nul set /p str="�������� ��४�ਨ ��� HEd...           "
    md "%hedd%" > nul
    if exist "%hedd%" (
        echo [������]
        goto copy
    ) else (
        echo [������]
        echo ���������� ᮧ����� ����� �����! ��室...
        goto exit
    )
)        

:copy
<nul set /p str="����஢���� 䠩���...                    "
cd /d %~dp0
cd ..\source
copy /Y hed* "%hedd%" > nul
if %ERRORLEVEL% == 0 (
    echo [������]
    echo.
    if %ex%==0 (
       echo ������ ������ "Refresh FNDB" � MikTeX Settings
       timeout /t 5 /nobreak > nul
    ) else (
       echo ���������� �ᯥ譮 ��⠭������
    )
) else (
    echo [������]
    echo ���������� ᪮��஢��� 䠩��! ��室...
)

:exit
cd /d %~dp0
timeout /t 3 > nul
