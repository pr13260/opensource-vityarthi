#!/bin/bash
# Script 2: FOSS Package Inspector
PACKAGE="vlc" # e.g. httpd, mysql, vlc, firefox
# Check if package is installed
if dpkg -s "$PACKAGE" &>/dev/null; then
 echo "$PACKAGE is installed."
 # this is a workaraound  which works on my distro ...
 VERSION=$(dpkg-query -W -f='${Version}' "$PACKAGE" 2>/dev/null)
 SUMMARY=$(dpkg-query -W -f='${binary:Summary}' "$PACKAGE" 2>/dev/null)
 LICENSE=$(awk -F': ' '/^License:/{print $2; exit}' "/usr/share/doc/$PACKAGE/copyright" 2>/dev/null)
 LICENSE=${LICENSE:-N/A}
 echo "Version: $VERSION"
 echo "License: $LICENSE"
 echo "Summary: $SUMMARY"
else
 echo "$PACKAGE is NOT installed."
fi
# TODO: Add a case statement that prints a one-line
# philosophy note about the package based on its name
case $PACKAGE in
 httpd) echo "Apache: the web server that built the open internet" ;;
 mysql) echo "MySQL: open source at the heart of millions of apps" ;;
 vlc) echo "VLC: the open source multimedia player" ;;
 firefox) echo "Firefox: the open source web browser" ;;
esac