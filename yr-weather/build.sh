#!/bin/bash
cd "$(dirname "$0")"
rm -f yr-weather.zip
zip -r yr-weather.zip src/
echo "Built yr-weather.zip"
