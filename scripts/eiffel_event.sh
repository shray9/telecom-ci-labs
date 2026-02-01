#!/bin/bash

EVENT_TYPE=$1
EVENT_ID=$(cat /proc/sys/kernel/random/uuid)
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Ensure directory exists (VERY IMPORTANT)
mkdir -p eiffel/events

EVENT_FILE="eiffel/events/${EVENT_TYPE}-${EVENT_ID}.json"

cat <<EOF > "$EVENT_FILE"
{
  "meta": {
    "id": "${EVENT_ID}",
    "type": "${EVENT_TYPE}",
    "time": "${TIMESTAMP}",
    "source": {
      "domainId": "jenkins.ericsson.lab"
    }
  },
  "data": {
    "pipeline": "telecom-ci",
    "jenkinsBuild": "${BUILD_NUMBER}",
    "status": "SUCCESS"
  }
}
EOF

echo "✅ Eiffel Event Generated: $EVENT_FILE"
