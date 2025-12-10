# Smart Traffic Management System
# Frontend Startup Script

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Smart Traffic Management System" -ForegroundColor Cyan
Write-Host "Frontend Installation and Startup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Step 1: Installing dependencies..." -ForegroundColor Yellow
npm install

Write-Host ""
Write-Host "Step 2: Starting development server..." -ForegroundColor Yellow
Write-Host "The app will open at http://localhost:3000" -ForegroundColor Green
Write-Host "Make sure your backend is running on http://localhost:8080" -ForegroundColor Green
Write-Host ""

npm start
