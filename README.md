# Elfie Studio

This is the main repository for Elfie Studio, containing submodules for various services and UI components.

## Repositories

The project consists of the following submodules located in the `repos/` directory:

- **console**: Admin console application (`main` branch)
- **gamification-service**: Gamification backend service (`develop` branch)
- **elfie-ui**: Main UI application (`staging` branch)
- **content-service**: Content management service (`develop` branch)

## Setup

1. **Clone the repository with submodules:**
   ```bash
   git clone --recursive <repo-url>
   ```
   Or if you already cloned it without recursive:
   ```bash
   git submodule update --init --recursive
   ```

2. **Install dependencies for all projects:**
   ```bash
   npm run install:all
   ```
   Or directly:
   ```bash
   ./install-all-packages.sh
   ```

## Scripts

- `npm run pull:submodules`: Updates all submodules to their configured remote branches.
- `npm run install:all`: Installs dependencies for all submodules in parallel.

## Directory Structure

```
elfie-studio/
├── repos/                  # Submodules
├── script/                 # Utility scripts
│   └── pull-latest-submodules.sh
├── install-all-packages.sh # Install script
├── package.json
└── README.md
```
