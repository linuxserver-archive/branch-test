#!/bin/bash
unset TAG PAYLOAD

TAG='1.1'
PAYLOAD='{"source_type": "Tag", "source_name": "'"$TAG"'"}'

curl -H "Content-Type: application/json" --data "${PAYLOAD}" -X POST https://registry.hub.docker.com/u/linuxserver/branch-test/trigger/bbee250e-0b92-40d7-a339-8180c27d2d1e/

