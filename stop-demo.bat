@echo off
setlocal
cd /d "%~dp0"
if not exist ".server.pid" (
  echo Kein gestarteter Demo-Server gefunden.
  exit /b 0
)
set /p DEMO_PID=<.server.pid
taskkill /PID %DEMO_PID% /F >nul 2>&1
del /q ".server.pid"
echo Anders-Finanz-Demo beendet.
endlocal
