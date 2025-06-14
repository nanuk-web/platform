FROM node:18-alpine AS builder

WORKDIR /app

COPY . .

RUN npm install --frozen-lockfile
RUN npm run build

FROM node:18-alpine

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app ./

RUN npm install --omit=dev

EXPOSE 3000

CMD ["npm", "start"]
