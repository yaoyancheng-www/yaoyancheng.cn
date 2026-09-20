#!/bin/bash

echo "=========================================="
echo "  GITPULL - Smart Pull with Force Fallback"
echo "=========================================="
echo ""

if git pull origin main; then
    echo ""
    echo "[OK] Pull succeeded."
    exit 0
fi

echo ""
echo "[WARN] Pull failed, switching to force mode..."
echo ""

git fetch origin
git reset --hard origin/main
git clean -fd

echo ""
echo "[OK] Force pull completed (reset + clean)."