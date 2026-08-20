@echo off
setlocal
cd /d "%~dp0"
if exist ".server.pid" (
  echo Die Demo scheint bereits zu laufen.
  start "" "http://127.0.0.1:4187"
  exit /b 0
)
powershell.exe -NoProfile -Command "$p = Start-Process -FilePath 'python' -ArgumentList '-m','http.server','4187','--bind','127.0.0.1' -WorkingDirectory '%~dp0' -WindowStyle Hidden -PassThru; Set-Content -LiteralPath '.server.pid' -Value $p.Id"
timeout /t 1 /nobreak >nul
start "" "http://127.0.0.1:4187"
echo Anders-Finanz-Demo gestartet: http://127.0.0.1:4187
endlocal
