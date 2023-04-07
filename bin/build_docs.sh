#!/usr/bin/env bash

set -e

echo ""
echo "========================================="
echo "  Building exccdocs into directory site/  "
echo "========================================="
echo ""

mkdocs build --clean --strict -f mkdocs.yml -d site

echo ""
echo "==================="
echo "  Build complete"
echo "==================="
echo ""
