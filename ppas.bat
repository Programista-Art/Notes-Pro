@echo off
SET THEFILE=E:\Programowanie na Delphi\Lazarus projekty\Moje programy\Notes Pro 14.11.2022\Aktualnie_pracuje_2024\Notes-Pro\Notes Pro.exe
echo Linking %THEFILE%
E:\Lazarus3\fpc\3.2.2\bin\x86_64-win64\ld.exe -b pei-x86-64  --gc-sections  -s --subsystem windows --entry=_WinMainCRTStartup    -o "E:\Programowanie na Delphi\Lazarus projekty\Moje programy\Notes Pro 14.11.2022\Aktualnie_pracuje_2024\Notes-Pro\Notes Pro.exe" "E:\Programowanie na Delphi\Lazarus projekty\Moje programy\Notes Pro 14.11.2022\Aktualnie_pracuje_2024\Notes-Pro\link19896.res"
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
