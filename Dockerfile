# installing dependencies only when neeed
FROM node:alpine AS deps

WORKDIR /opt/app
COPY package*.json ./
#RUN yarn install --frozen-lockfile
RUN npm ci

# rebuild the source code only when needed - speed up building
FROM node:alpine AS builder

ENV NODE_ENV=production
WORKDIR /opt/app
COPY . .
COPY --from=deps /opt/app/node_modules ./node_modules
#RUN yarn build
RUN npm run build

#production env - copy all file and run next
FROM node:alpine AS runner 

ARG X_TAG
WORKDIR /opt/app
ENV NODE_ENV=production 
COPY --from=builder /opt/app/next.config.js ./
COPY --from=builder /opt/app/public ./public
COPY --from=builder /opt/app/.next ./.next
COPY --from=builder /opt/app/node_modules ./node_modules
RUN npm install next

EXPOSE 3000
CMD ["npm","run","start"]
