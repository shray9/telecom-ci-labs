#!/bin/bash

EVENT_TYPE=$1
EVENT_ID=$(uuidgen)
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

EVENT_FILE="eiffel/events/${EVENT_TYPE}-${EVENT_ID}.json"

cat <<EOF > $EVENT_FILE
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

