@echo off
if "%1"=="AL950724" goto al950724
if "%1"=="AL_11" goto al_11
echo You need to pass a supported UPPERCASE directory name as an argument.
echo Currently accepted: AL950724, AL_11
goto end

:al950724
set ASSREV=19950724
goto task
:al_11
set ASSREV=19960116
goto task

:task
md %1
md %1\OBJ
wmake.exe -f audio.mak "version = production" "libver_libdef = %1" "libver_assrev = %ASSREV%"
:end
