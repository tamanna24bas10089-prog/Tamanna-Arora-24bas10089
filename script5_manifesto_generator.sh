#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Aryan Mehta | Course: Open Source Software
# Asks the user 3 questions, builds a personalised manifesto paragraph,
# saves it to a .txt file named after the current user
# Concepts: read, string concatenation, writing to file with >, date, aliases (shown in comments)

# --- Alias concept demo (comment) ---
# In a real shell session you could type: alias today='date +%d-%m-%Y'
# and then just type 'today' instead of the full date command
# We don't activate it here since aliases don't persist in scripts by default

echo ""
echo "========================================================"
echo "   Open Source Manifesto Generator"
echo "========================================================"
echo "  Answer three questions and we'll write your manifesto."
echo "========================================================"
echo ""

# --- Ask the user three questions ---
# read -p shows the prompt on the same line as input

read -p "1. Name one open-source tool you use every day: " Git
read -p "2. In one word, what does 'freedom' mean to you? " Learning
read -p "3. Name one thing you would build and share freely: " Educational_app

# --- Capture the date nicely ---
DATE=$(date '+%d %B %Y')

# --- Output filename: manifesto_<username>.txt ---
OUTPUT="manifesto_$(whoami).txt"

echo ""
echo "  Writing your manifesto..."
echo ""

# --- Build the manifesto using string concatenation with echo and >> ---
# We overwrite the file first with > then append the rest with >>

echo "========================================" > "$OUTPUT"
echo "  My Open Source Manifesto" >> "$OUTPUT"
echo "  Generated on: $DATE" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Main paragraph - strings are concatenated naturally through multiple echo calls
# USER variable gives the currently logged in username
echo "I, $(whoami), am part of the open source generation." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every day I rely on $Git — a tool built not for profit, but for people." >> "$OUTPUT"
echo "To me, freedom means $Learning. Not just the freedom to use software," >> "$OUTPUT"
echo "but the freedom to understand it, improve it, and share it without asking permission." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "If I could build anything and release it to the world, I would build $Educational_app." >> "$OUTPUT"
echo "I would license it openly so that every person, in every country, could use" >> "$OUTPUT"
echo "it, learn from it, and make it better than I ever could alone." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not just about code. It is about trust, community," >> "$OUTPUT"
echo "and the belief that knowledge shared is knowledge multiplied." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  — $(whoami) | $DATE" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"

# --- Confirm the file was created and show it ---
echo "  [OK] Manifesto saved to: $OUTPUT"
echo ""
echo "--- Contents of $OUTPUT ---"
echo ""
cat "$OUTPUT"
echo ""

