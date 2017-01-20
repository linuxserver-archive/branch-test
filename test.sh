#!/bin/bash
unset HUB_REPO HUB_TOKEN HUB_URL PAYLOAD TAG

TAG='1.0'
PAYLOAD='{"source_type": "Tag", "source_name": "'"$TAG"'"}'

HUB_REPO="linuxserver/branch-test"
HUB_TOKEN="bbee250e-0b92-40d7-a339-8180c27d2d1e"
HUB_URL="https://registry.hub.docker.com/u/${HUB_REPO}/trigger/${HUB_TOKEN}/"


curl -H "Content-Type: application/json" --data "${PAYLOAD}" -X POST "${HUB_URL}"

