FROM node:18-alpine AS builder

# 1. Dossier principal du projet
WORKDIR /app

# 2. Copier uniquement le dossier desktop
COPY ./desktop ./desktop

# 3. Entrer dans le sous-dossier
WORKDIR /app/desktop

# 4. Installer et builder
RUN npm install --frozen-lockfile
RUN npm run build

# 5. Phase de production
FROM node:18-alpine

WORKDIR /app

# Copier le build uniquement
COPY --from=builder /app/desktop ./

# Installer les deps de prod (si nécessaires)
RUN npm install --omit=dev || true

EXPOSE 3000

CMD ["npm", "run", "preview"]
