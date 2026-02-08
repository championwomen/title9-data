#!/bin/bash
# Build Lightdash from source for ARM64 (Apple Silicon) Macs
# This creates a native ARM64 image for better performance

set -e

echo "=========================================="
echo "Building Lightdash from source"
echo "=========================================="
echo ""
echo "This will build Lightdash locally for your architecture."
echo "Note: First build takes 10-15 minutes. Subsequent builds are faster."
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Error: Docker is not running"
    exit 1
fi

# Check architecture
ARCH=$(uname -m)
echo "Detected architecture: $ARCH"

if [ "$ARCH" = "arm64" ]; then
    echo "Building for ARM64 (Apple Silicon)"
else
    echo "Building for x86_64"
fi

echo ""
echo "Starting build..."
echo "This may take 10-15 minutes depending on your machine."
echo ""

# Build the image
docker compose build --no-cache lightdash

echo ""
echo "=========================================="
echo "✓ Build complete!"
echo "=========================================="
echo ""
echo "To start Lightdash:"
echo "  docker compose up -d lightdash"
echo ""
echo "To view logs:"
echo "  docker compose logs -f lightdash"
echo ""
echo "Access Lightdash at: http://localhost:8080"
