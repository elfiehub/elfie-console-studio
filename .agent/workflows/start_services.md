---
description: Start development servers for Backend Services (Content & Gamification)
---

## 1. Content Service
**Location**: `repos/content-service`
**Stack**: NestJS v11

Start in Development mode:
```bash
cd repos/content-service
pnpm run start:dev
```

## 2. Gamification Service
**Location**: `repos/gamification-service`
**Stack**: NestJS v11

Start in Development mode:
```bash
cd repos/gamification-service
pnpm run start:dev
```

## Troubleshooting
If `PrismaClient` is missing:
```bash
# Content Service
cd repos/content-service
pnpm exec prisma generate

# Gamification Service
cd repos/gamification-service
pnpm exec prisma generate
```
