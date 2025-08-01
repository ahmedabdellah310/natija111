@echo off
echo Cleaning up unnecessary files...
echo.

echo Removing server files...
if exist server\ (
    rmdir /s /q "server"
    echo Removed server directory
)

if exist node_modules\ (
    rmdir /s /q "node_modules"
    echo Removed node_modules directory
)

echo Removing individual files...
del /q "server.js" 2>nul && echo Removed server.js
del /q "start.bat" 2>nul && echo Removed start.bat
del /q "vite.config.js" 2>nul && echo Removed vite.config.js
del /q "kill-port.js" 2>nul && echo Removed kill-port.js

echo.
echo Cleanup complete!
echo The project is now ready for GitHub Pages deployment.
echo Run 'deploy-to-github.bat' to deploy your site.
echo.
pause
