@echo off
if "%1"=="AL950724" goto task
echo You need to pass a supported UPPERCASE directory name as an argument.
echo Currently accepted: AL950724
goto end
:task
md %1
md %1\OBJ
rem Only a single AUDIOLIB revision is currently supported
wmake.exe -f audio.mak "version = production" "libver_libdef = %1" "libver_assrev = 19950724L"
:end
