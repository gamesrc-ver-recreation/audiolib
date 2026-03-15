@echo off
cls
type BATCHLST.TXT
choice /C:12345670 /N Please select what to build:
echo.
if ERRORLEVEL 8 goto end
if ERRORLEVEL 7 goto al_rotts
if ERRORLEVEL 6 goto al_rottd
if ERRORLEVEL 5 goto al_rottb
if ERRORLEVEL 4 goto al_112
if ERRORLEVEL 3 goto al_11
if ERRORLEVEL 2 goto al_109
if ERRORLEVEL 1 goto al_104

:al_104
set ASSREV=19950518
set DIR=AL_104
set OBJDIR=OBJ
goto task
:al_109
set ASSREV=19960108
set DIR=AL_109
set OBJDIR=OBJ
goto task
:al_11
set ASSREV=19960116
set DIR=AL_11
set OBJDIR=OBJ
goto task
:al_112
set ASSREV=19960514
set DIR=AL_112
set OBJDIR=OBJ
goto task
:al_rottb
set ASSREV=20011231
set DIR=AL_ROTTB
set OBJDIR=OBJ
goto task
:al_rottd
set ASSREV=20011231
set DIR=AL_ROTTD
set OBJDIR=OBJDB
goto task
:al_rotts
set ASSREV=20021225
set DIR=AL_ROTTS
set OBJDIR=OBJ
goto task

:task
md %DIR%
md %DIR%\%OBJDIR%
set VER=production
if %OBJDIR% == OBJDB set VER=debugging
wmake.exe -f audio.mak "version = %VER%" "libver_libdef = %DIR%" "libver_assrev = %ASSREV%"
:end
