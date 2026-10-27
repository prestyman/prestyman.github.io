
@echo off
setlocal
title GitHub Pages Publisher
cd /d "C:\ALL Online\GitHub\landing"

echo ========================================
echo       GITHUB PAGES PUBLISHER
echo ========================================
echo.

echo Checking for changes...
git add -A
if errorlevel 1 goto error

git diff --cached --quiet
if errorlevel 1 goto changes

echo No new changes to commit.
goto publish

:changes
echo.
set "message="
set /p "message=Describe your changes (Enter for Website update): "

if not defined message set "message=Website update"

echo.
git commit -m "%message%"
if errorlevel 1 goto error

:publish
echo.
echo Publishing to GitHub...
git push
if errorlevel 1 goto error

echo.
echo ========================================
echo   SUCCESS! Changes pushed to GitHub.
echo ========================================
echo.
echo Website: https://prestyman.github.io/
echo.
pause
exit /b 0

:error
echo.
echo ========================================
echo   ERROR! Publishing was not completed.
echo ========================================
echo.
pause
exit /b 1
