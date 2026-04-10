#!/bin/bash
cd "$(dirname "$0")"
rm -f posthog-analytics.zip
zip -r posthog-analytics.zip src/
echo "Built posthog-analytics.zip"
