#!/bin/bash

TIMEOUT=30

echo "=========================================="
echo "  GITPULL - Smart Pull with Force Fallback"
echo "=========================================="
echo ""

echo "[1/2] Trying normal pull (timeout ${TIMEOUT}s)..."
if timeout ${TIMEOUT} git pull origin main 2>&1; then
    echo ""
    echo "[OK] Pull succeeded."
    exit 0
fi

echo ""
echo "[WARN] Pull failed (network issue or conflict), switching to force mode..."
echo ""

echo "[2/2] Fetching latest (timeout ${TIMEOUT}s)..."
if ! timeout ${TIMEOUT} git fetch origin 2>&1; then
    echo ""
    echo "[FAIL] Cannot reach GitHub. Check network or proxy."
    exit 1
fi

echo "Resetting to origin/main..."
git reset --hard origin/main
git clean -fd

echo ""
echo "[OK] Force pull completed (reset + clean)."