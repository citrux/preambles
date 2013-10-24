@echo off
cd %programfiles%
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
cd %~dp0
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
timeout /t 3 /nobreak > nul
