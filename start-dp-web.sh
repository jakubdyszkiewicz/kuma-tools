#!/bin/bash
kumactl generate dataplane-token --name web-01 --mesh default > /tmp/kuma-web-token
kuma-dp run --dns-enabled=false --dataplane-token-file=/tmp/kuma-web-token --dataplane-file=/Users/jakob/kong/kuma-tools/dp-web.yaml --cp-address=https://localhost:5678
