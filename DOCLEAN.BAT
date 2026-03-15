@echo off
cls
type BATCHLST.TXT
choice /C:12345670 /N Please select what to clean:
echo.
if ERRORLEVEL 8 goto end
if ERRORLEVEL 1 set DIR=AL_104
if ERRORLEVEL 2 set DIR=AL_109
if ERRORLEVEL 3 set DIR=AL_11
if ERRORLEVEL 4 set DIR=AL_112
if ERRORLEVEL 5 set DIR=AL_ROTTB
if ERRORLEVEL 6 set DIR=AL_ROTTD
if ERRORLEVEL 7 set DIR=AL_ROTTS

del %DIR%\OBJDB\*.*
del %DIR%\OBJ\*.*
del %DIR%\*.*
:end
