---
description: Setup the Elfie Studio monorepo by installing all dependencies.
---

This workflow installs dependencies for all repositories in the `repos/` directory.

1. Ensure the install script is executable
// turbo
```bash
chmod +x ./install-all-packages.sh
```

2. Run the installation script
// turbo
```bash
./install-all-packages.sh
```

3. Verification
   - Check that `node_modules` exists in `repos/console`
   - Check that `node_modules` exists in `repos/content-service`
   - Check that `node_modules` exists in `repos/gamification-service`
