#!/bin/sh

echo "Version is $1"

ID=`docker images --filter=reference=kuma/kuma-cp:$1 --format "{{.ID}}"`
echo "ID is $ID"
docker tag $ID "jakubdyszkiewicz/kuma-cp:$1"
docker push "jakubdyszkiewicz/kuma-cp:$1"

ID=`docker images --filter=reference=kuma/kuma-dp:$1 --format "{{.ID}}"`
echo "ID is $ID"
docker tag $ID "jakubdyszkiewicz/kuma-dp:$1"
docker push "jakubdyszkiewicz/kuma-dp:$1"

ID=`docker images --filter=reference=kuma/kuma-init:$1 --format "{{.ID}}"`
echo "ID is $ID"
docker tag $ID "jakubdyszkiewicz/kuma-init:$1"
docker push "jakubdyszkiewicz/kuma-init:$1"