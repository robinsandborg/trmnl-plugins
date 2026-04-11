#!/bin/bash
cd "$(dirname "$0")"
rm -f google-calendar-week.zip
zip -r google-calendar-week.zip src/
echo "Built google-calendar-week.zip"
