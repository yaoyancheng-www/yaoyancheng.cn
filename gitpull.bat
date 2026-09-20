@echo off
chcp 65001 >nul
echo ==========================================
echo   GITPULL - Smart Pull with Force Fallback
echo ==========================================
echo.

echo [1/2] Trying normal pull...
git pull origin main
if %ERRORLEVEL% EQU 0 (
    echo.
    echo [OK] Pull succeeded.
    goto :end
)

echo.
echo [WARN] Pull failed, switching to force mode...
echo.

echo [2/2] Fetching latest...
git fetch origin
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [FAIL] Cannot reach GitHub. Check network or proxy.
    goto :end
)

echo Resetting to origin/main...
git reset --hard origin/main
git clean -fd

echo.
echo [OK] Force pull completed (reset + clean).

:end
echo.
pause