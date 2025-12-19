---
description: Start development servers for Console (Frontend & API)
---

## 1. Start Console Frontend
**Location**: `repos/console`
**Port**: Typically 5173 (Vite)

```bash
cd repos/console
npm run dev:fe
```

## 2. Start Console API
**Location**: `repos/console`
**Port**: 4000 (Express/Apollo)

```bash
cd repos/console
npm run dev:api
```

## 3. Generate Prisma Client (If needed)
If you encounter errors about missing client:
```bash
cd repos/console
npm run generate
```
