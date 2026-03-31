#!/bin/bash
# Script 3: Disk and Permission Auditor

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================================"
echo "         Directory Audit Report"
echo "========================================================"
echo ""

for DIR in "${DIRS[@]}"; do

    if [ -d "$DIR" ]; then

        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "  Directory : $DIR"
        echo "  Permissions: $PERMS   Owner: $OWNER   Group: $GROUP"
        echo "  Disk Usage : $SIZE"
        echo "  -------------------------------------------------------"

    else
        echo "  [SKIP] $DIR — does not exist"
        echo "  -------------------------------------------------------"
    fi

done

echo ""

# --- Git related check ---
echo "========================================================"
echo "        Git Configuration Directory Check"
echo "========================================================"
echo ""

GIT_CONF="$HOME/.gitconfig"

if [ -f "$GIT_CONF" ]; then
    PERMS=$(ls -l "$GIT_CONF" | awk '{print $1}')
    OWNER=$(ls -l "$GIT_CONF" | awk '{print $3}')
    echo "  Found: $GIT_CONF"
    echo "  Permissions: $PERMS  |  Owner: $OWNER"
else
    echo "  Git configuration file not found."
fi

echo ""
