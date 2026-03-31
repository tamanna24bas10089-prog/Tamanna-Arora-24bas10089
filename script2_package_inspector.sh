#!/bin/bash 

# Package we are inspecting
PACKAGE="git"

echo "====================================="
echo "  FOSS Package Inspector"
echo "====================================="
echo ""

# Check if package is installed
if rpm -q "$PACKAGE" &>/dev/null; then
    echo "[OK] $PACKAGE is installed (rpm system)."
    echo "--- Package Details ---"
    rpm -qi "$PACKAGE" | grep -E "^Version|^License|^Summary"

elif dpkg -l "$PACKAGE" &>/dev/null 2>&1; then
    echo "[OK] $PACKAGE is installed (dpkg system)."
    echo "--- Package Details ---"
    dpkg -l "$PACKAGE" | grep "^ii"

else
    echo "[!!] $PACKAGE is NOT installed."
    echo "Install using: sudo apt install $PACKAGE"
fi

echo ""
echo "--- Open Source Note ---"

case "$PACKAGE" in
    git)
        echo "Git: distributed version control system."
        echo "Developed by Linus Torvalds, licensed under GPLv2."
        ;;
    *)
        echo "$PACKAGE is an open-source software."
        ;;
esac
