#!/usr/bin/env bash
# Requires docker 17.05 or higher

set -e

echo ""
echo "================================="
echo "  Building exccdocs docker image  "
echo "================================="
echo ""

IMAGE_NAME=exccco/exccdocs

if [ "$1" != "" ]; then
    IMAGE_NAME=$1
fi

docker build -t $IMAGE_NAME .

echo ""
echo "==================="
echo "  Build complete"
echo "==================="
echo ""
echo "You can now run exccdocs with the following command:"
echo "    docker run -d --rm -p <local port>:80 $IMAGE_NAME:latest"
echo ""
