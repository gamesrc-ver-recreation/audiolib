@echo off
if "%1"=="AL950724" goto task
echo You need to pass a supported UPPERCASE directory name as an argument.
echo Currently accepted: AL950724
goto end
:task
del %1\OBJ\*.*
del %1\*.*
:end
