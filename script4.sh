#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./log_analyzer.sh /var/log/messages # i would use it but my distro doesnt write to it 
# ill use /var/log/auth.log instead
LOGFILE=$1
KEYWORD=${2:-"prince"} # same case this can be either root or prince nothin else
COUNT=0
if [ ! -f "$LOGFILE" ]; then
 echo "Error: File $LOGFILE not found."
 exit 1
fi
while IFS= read -r LINE; do
 if echo "$LINE" | grep -iq "$KEYWORD"; then
 COUNT=$((COUNT + 1))
 fi
done < "$LOGFILE"
echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
MATCHING_LINES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -n 5 || true)
if [ -n "$MATCHING_LINES" ]; then
 echo "Last 5 matching lines:"
 printf "%s\n" "$MATCHING_LINES"
else
 echo "No matching lines found."
fi
