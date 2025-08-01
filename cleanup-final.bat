@echo off
echo Cleaning up unnecessary files...
echo.

:: Remove node_modules directory
if exist node_modules (
    echo Removing node_modules directory...
    rmdir /s /q node_modules
)

:: Remove server directory
if exist server (
    echo Removing server directory...
    rmdir /s /q server
)

:: Remove individual files
del /q start.bat 2>nul
del /q server.js 2>nul
del /q vite.config.js 2>nul
del /q kill-port.js 2>nul
del /q start-server.bat 2>nul

echo.
echo Cleanup complete!
echo The following files and directories were kept:
echo - index.html
echo - 404.html
echo - README.md
echo - data/
echo - .gitignore
echo - deploy-to-github.bat
echo.
echo You can now run deploy-to-github.bat to deploy to GitHub Pages.
pause
