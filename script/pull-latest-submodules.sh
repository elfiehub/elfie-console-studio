#!/bin/bash

# Navigate to project root
cd "$(dirname "$0")/.."

echo "Syncing submodules to committed state..."
git submodule update --remote --recursive

echo "Submodules updated."
