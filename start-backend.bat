@echo off
echo ========================================
echo Starting Traffic Management Backend
echo ========================================
echo.

cd /d "%~dp0backend"

echo Starting Spring Boot application...
echo Application will be available at http://localhost:8080
echo.

call "C:\Users\Dell\.maven\maven-3.9.11\bin\mvn.cmd" spring-boot:run "-Dspring-boot.run.jvmArguments=-Djava.home=C:\Users\Dell\.jdk\jdk-21.0.8"
