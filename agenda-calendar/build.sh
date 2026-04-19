#!/bin/bash
cd "$(dirname "$0")"
rm -f agenda-calendar.zip
zip -r agenda-calendar.zip src/
echo "Built agenda-calendar.zip"
