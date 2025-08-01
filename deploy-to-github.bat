@echo off
echo =======================================
echo  GitHub Pages Deployment Assistant
echo =======================================
echo.

:: Check if Git is installed
git --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Git is not installed or not in PATH.
    echo Please install Git from: https://git-scm.com/downloads
    pause
    exit /b 1
)

echo [INFO] Initializing Git repository...
git init

echo.
echo [INFO] Adding files to Git...
git add .

:: Check if there are any changes to commit
git diff --cached --quiet
if %ERRORLEVEL% equ 0 (
    echo [INFO] No changes to commit.
) else (
    echo [INFO] Committing changes...
    git commit -m "Initial commit - Ready for GitHub Pages"
)

echo.
echo =======================================
echo  GitHub Repository Setup Instructions
echo =======================================
echo.
echo 1. Create a new repository on GitHub:
echo    - Go to https://github.com/new
    
echo    - Enter repository name (e.g., 'thanawya-results')
echo    - Choose Public or Private
echo    - DO NOT initialize with README, .gitignore, or license
echo    - Click 'Create repository'
echo.

echo 2. After creating the repository, copy the repository URL.
echo    (It should look like: https://github.com/username/repository.git)
echo.

set /p GIT_URL="Enter the GitHub repository URL: "

if "%GIT_URL%"=="" (
    echo [ERROR] No URL provided. Exiting.
    pause
    exit /b 1
)

echo.
echo [INFO] Adding remote repository...
git remote add origin %GIT_URL%

echo [INFO] Renaming default branch to 'main'...
git branch -M main

echo [INFO] Pushing to GitHub...
git push -u origin main

echo.
echo =======================================
echo  Deployment Complete!
echo =======================================
echo.
echo Your website will be available at:
echo https://YOUR_USERNAME.github.io/YOUR_REPOSITORY_NAME/
echo.
echo To enable GitHub Pages:
echo 1. Go to your repository on GitHub
echo 2. Click on 'Settings' > 'Pages'
echo 3. Under 'Source', select 'main' branch
echo 4. Click 'Save'
echo.
echo Note: It may take a few minutes for your site to be available.
echo.
pause
