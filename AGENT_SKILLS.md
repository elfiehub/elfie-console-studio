# Agent Skills & Guidelines for Elfie Studio

This document defines the skills, technical stacks, workflows, and best practices for the AI agent working on the Elfie Studio repositories ("Console", "Content Service", and "Gamification Service").

## 1. Global Context
*   **Monorepo Location**: `repos/` directory.
*   **Package Managers**: `npm` (Console), `pnpm` (Services).
*   **Database**: PostgreSQL via Prisma (all services).

---

## 2. Console (`repos/console`)
**Directory**: `/repos/console`
**Type**: Monorepo (NPM Workspaces)

### 2.1 Frontend (`packages/frontend`)
**Stack**:
*   **Framework**: Vue 3 (Composition API / Script Setup).
*   **Build Tool**: Vite (Rolldown).
*   **State Management**: Pinia.
*   **Styling**: Tailwind CSS v4 + PrimeVue + Radix Vue.
*   **GraphQL Client**: Villus.
*   **Testing**: Vitest + Playwright.

**Key Skills for Agent**:
*   **Vue 3 Patterns**: Always use `<script setup lang="ts">`. Use composables for reusable logic.
*   **Tailwind v4**: Note that v4 is being used; configuration is often CSS-first.
*   **GraphQL Integration**: Use `villus` for queries/mutations.
    ```typescript
    import { useQuery } from 'villus';
    const { data } = useQuery({ query: '...' });
    ```
*   **Component Library**: Prioritize usage of PrimeVue components over building from scratch. Use Radix Vue for headless accessibility primitives.

### 2.2 API (`packages/api`)
**Stack**:
*   **Framework**: Express.js (ES Modules).
*   **GraphQL**: Apollo Server.
*   **ORM**: Prisma.
*   **Language**: TypeScript (ESM).

**Key Skills for Agent**:
*   **Express + Apollo**: This is NOT NestJS. It uses standard Express middleware with Apollo Server.
*   **Prisma Usage**:
    *   Generate: `npm run generate`
    *   Migrations: `npm run migrate`
*   **Type Safety**: Ensure strict TypeScript types for all GraphQL resolvers.

---

## 3. Content Service (`repos/content-service`)
**Directory**: `/repos/content-service`
**Type**: NestJS Microservice

**Stack**:
*   **Framework**: NestJS v11.
*   **ORM**: Prisma v6.
*   **Queues**: BullMQ.
*   **Key Libs**: @nestjs/swagger, class-validator, firebase-admin.

**Key Skills for Agent**:
*   **NestJS Architecture**: Follow strict Module-Controller-Service pattern.
*   **Validation**: Use `class-validator` DTOs for all inputs.
*   **Prisma Integration**:
    *   Commands: `pnpm exec prisma generate`, `pnpm exec prisma migrate dev`.
    *   Always use the `PrismaService` for DB access.
*   **Testing**: Jest is standard (unit & e2e).

---

## 4. Gamification Service (`repos/gamification-service`)
**Directory**: `/repos/gamification-service`
**Type**: NestJS Microservice

**Stack**:
*   **Framework**: NestJS v11.
*   **ORM**: Prisma v6.
*   **Big Data**: Google BigQuery (`@google-cloud/bigquery`).
*   **Queues**: BullMQ.

**Key Skills for Agent**:
*   **NestJS Architecture**: Same as Content Service.
*   **BigQuery**: When querying analytics data, use the BigQuery client. Ensure queries are optimized for cost and performance.
*   **Gamification Logic**: Likely involves points, rewards, and user progression. Logic should be cleanly separated into services.

---

## 5. Common Tasks & Commands

### 5.1 Installation
*   **Console**: `npm install` (in `repos/console`)
*   **Services**: `pnpm install` (in `repos/content-service` and `repos/gamification-service`)

### 5.2 Database Updates
When modifying `schema.prisma`:
1.  **Console**: `npm run migrate:generate <name>` -> `npm run migrate`
2.  **Services**: `pnpm exec prisma migrate dev --name <name>`
