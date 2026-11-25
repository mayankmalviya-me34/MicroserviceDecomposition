FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY . .
ENV NODE_ENV=dev
EXPOSE 8001
CMD ["node", "src/index.js"]