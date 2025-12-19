#!/bin/bash

# Navigate to project root
cd "$(dirname "$0")/.."

echo "Updating submodules from remote..."
git submodule update --remote --recursive

echo "Submodules updated."
