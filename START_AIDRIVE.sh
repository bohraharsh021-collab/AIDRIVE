#!/usr/bin/env bash
# AIDRIVE Linux/macOS 1-Click Launcher
echo "===================================================================="
echo "       AIDRIVE: The Shoemaker's Agentic Pen Drive"
echo "       Bannari Amman Institute of Technology (BIT Sathy)"
echo "===================================================================="

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if command -v python3 &>/dev/null; then
    PYTHON_CMD="python3"
elif command -v python &>/dev/null; then
    PYTHON_CMD="python"
else
    echo "[ERROR] Python 3 not found on this system!"
    exit 1
fi

echo "[AIDRIVE] Launching Shoemaker Terminal Workshop..."
$PYTHON_CMD "$DIR/core/cli.py"
