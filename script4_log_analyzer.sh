#!/bin/bash
# Script 4: Log Analyzer

LOGFILE="sample_log.txt"
KEYWORD="error"
COUNT=0

# --- Create sample log file (so it always works) ---
echo "info: git initialized" > $LOGFILE
echo "error: failed to commit" >> $LOGFILE
echo "warning: branch not found" >> $LOGFILE
echo "error: merge conflict" >> $LOGFILE
echo "info: push successful" >> $LOGFILE

echo "========================================================"
echo "  Log File Analyzer"
echo "========================================================"
echo "  File    : $LOGFILE"
echo "  Keyword : $KEYWORD"
echo "========================================================"
echo ""

# --- Read file ---
while read LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "  Result: '$KEYWORD' found $COUNT times"
echo ""

echo "--- Matching lines ---"
grep -i "$KEYWORD" "$LOGFILE"

echo "========================================================"
