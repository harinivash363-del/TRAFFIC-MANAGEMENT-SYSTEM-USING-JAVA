@echo off
echo ========================================
echo Smart Traffic Management System
echo Frontend Installation and Startup
echo ========================================
echo.

echo Step 1: Installing dependencies...
call npm install

echo.
echo Step 2: Starting development server...
echo The app will open at http://localhost:3000
echo Make sure your backend is running on http://localhost:8080
echo.

call npm start

pause
