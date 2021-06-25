#!/bin/bash
kumactl generate dataplane-token --name backend-01 --mesh default > /tmp/kuma-backend-token
kuma-dp run --dns-enabled=false --dataplane-token-file=/tmp/kuma-backend-token --dataplane-file=/Users/jakob/kong/kuma-tools/dp-backend.yaml --cp-address=https://localhost:5678
