---
description: database migration workflow for Console and Services
---

This workflow guides you through applying database changes for different parts of the stack.

## Context: Console (`repos/console`)
**Stack**: Prisma (NPM)
**Location**: `repos/console`

To create a new migration:
```bash
cd repos/console
npm run migrate:generate <migration_name>
```

To apply pending migrations:
```bash
cd repos/console
npm run migrate
```

---

## Context: Content & Gamification Services
**Stack**: Prisma (PNPM)
**Locations**: `repos/content-service`, `repos/gamification-service`

To create and apply a migration (Dev):
```bash
# Example for Content Service
cd repos/content-service
pnpm exec prisma migrate dev --name <migration_name>
```

To deploy migrations (Prod/Staging):
```bash
cd repos/content-service
pnpm exec prisma migrate deploy
```
