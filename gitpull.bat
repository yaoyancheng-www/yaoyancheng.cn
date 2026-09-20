@echo off
chcp 65001 >nul
echo ==========================================
echo   GITPULL - Smart Pull with Force Fallback
echo ==========================================
echo.

git pull origin main
if %ERRORLEVEL% EQU 0 (
    echo.
    echo [OK] Pull succeeded.
    goto :end
)

echo.
echo [WARN] Pull failed, switching to force mode...
echo.

git fetch origin
git reset --hard origin/main
git clean -fd

echo.
echo [OK] Force pull completed (reset + clean).

:end
echo.
pause