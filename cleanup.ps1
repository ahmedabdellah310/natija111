# PowerShell script to clean up unnecessary files
Write-Host "Cleaning up unnecessary files..." -ForegroundColor Cyan

# Remove server directory if it exists
if (Test-Path ".\server") {
    Remove-Item -Path ".\server" -Recurse -Force
    Write-Host "Removed server directory" -ForegroundColor Green
}

# Remove individual files
$filesToRemove = @(
    "start.bat",
    "server.js",
    "vite.config.js",
    "kill-port.js",
    "start-server.bat"
)

foreach ($file in $filesToRemove) {
    if (Test-Path $file) {
        Remove-Item -Path $file -Force
        Write-Host "Removed $file" -ForegroundColor Green
    }
}

Write-Host "\nCleanup complete!" -ForegroundColor Green
Write-Host "The project is now ready for GitHub Pages deployment." -ForegroundColor Cyan
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Run the deployment script if it exists
if (Test-Path ".\deploy-to-github.bat") {
    Write-Host "\nStarting deployment script..." -ForegroundColor Cyan
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c", "deploy-to-github.bat" -NoNewWindow -Wait
} else {
    Write-Host "\nDeployment script not found. Please run deploy-to-github.bat manually." -ForegroundColor Yellow
}
