# Dockerfile for Lightdash on ARM64 (Apple Silicon)
# Builds Lightdash from source for native ARM64 performance

FROM node:18-bullseye AS builder

# Install dependencies (including canvas build dependencies)
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    git \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Enable Corepack for pnpm/yarn management
RUN corepack enable

# Clone Lightdash repository
WORKDIR /build
RUN git clone --depth 1 https://github.com/lightdash/lightdash.git .

# Use pnpm (Lightdash's package manager)
RUN pnpm install --frozen-lockfile
RUN pnpm build

# Production stage
FROM node:18-bullseye-slim

# Install PostgreSQL client for healthchecks
RUN apt-get update && apt-get install -y \
    postgresql-client \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Enable Corepack
RUN corepack enable

WORKDIR /usr/src/app

# Copy built application from builder
COPY --from=builder /build/packages/backend/dist ./packages/backend/dist
COPY --from=builder /build/packages/frontend/build ./packages/frontend/build
COPY --from=builder /build/node_modules ./node_modules
COPY --from=builder /build/package.json ./package.json
COPY --from=builder /build/pnpm-workspace.yaml ./pnpm-workspace.yaml
COPY --from=builder /build/packages/backend/package.json ./packages/backend/package.json
COPY --from=builder /build/packages/frontend/package.json ./packages/frontend/package.json
COPY --from=builder /build/packages/common/package.json ./packages/common/package.json

# Environment variables
ENV NODE_ENV=production
ENV PORT=8080

EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=5 \
    CMD wget -q --spider http://localhost:8080/api/v1/health || exit 1

CMD ["node", "packages/backend/dist/index.js"]
