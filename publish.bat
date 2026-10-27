
@echo off
title GitHub Pages Publisher
cd /d "C:\ALL Online\GitHub\landing"

echo ========================================
echo       GITHUB PAGES PUBLISHER
echo ========================================
echo.

echo Checking for changes...
git add -A

git diff --cached --quiet
if %errorlevel%==0 (
    echo.
    echo No changes to commit.
    echo.
) else (
    echo.
    git commit -m "Website update"
    if errorlevel 1 goto error
)

echo.
echo Publishing to GitHub...
git push
if errorlevel 1 goto error

echo.
echo ========================================
echo   SUCCESS! Website published to GitHub.
echo ========================================
echo.
echo https://prestyman.github.io/
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
