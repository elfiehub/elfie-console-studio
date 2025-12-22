#!/bin/bash

REPOS_DIR="repos"

# Check if repos directory exists
if [ ! -d "$REPOS_DIR" ]; then
    echo "Repos directory '$REPOS_DIR' does not exist. Please run scripts/pull-latest-submodules.sh first."
    exit 1
fi

pids=()

echo "Starting parallel package installation..."

# Iterate over directories in repos/
for dir in "$REPOS_DIR"/*; do
    if [ -d "$dir" ]; then
        repo_name=$(basename "$dir")
        echo "Starting installation for $repo_name..."
        
        # Run installation in background
        (
            cd "$dir"
            if [ -f "yarn.lock" ]; then
                echo "[$repo_name] Detected yarn.lock, running yarn install..."
                yarn install
            elif [ -f "pnpm-lock.yaml" ]; then
                echo "[$repo_name] Detected pnpm-lock.yaml, running pnpm install..."
                pnpm install
            elif [ -f "package-lock.json" ]; then
                echo "[$repo_name] Detected package-lock.json, running npm install..."
                npm install
            elif [ -f "package.json" ]; then
                echo "[$repo_name] No lockfile found, defaulting to npm install..."
                npm install
            else
                echo "[$repo_name] No package.json found. Skipping."
            fi
        ) &
        
        # Store PID
        pids+=($!)
    fi
done

# Wait for all background processes to finish
if [ ${#pids[@]} -gt 0 ]; then
    echo "Waiting for all installations to complete..."
    for pid in "${pids[@]}"; do
        wait "$pid"
    done
    echo "All package installations completed."
else
    echo "No repositories found to install packages for."
fi
