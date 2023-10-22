FROM node:16-alpine AS staging
WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build

FROM node:16-alpine AS production
WORKDIR /home/root
COPY --from=staging /usr/src/app/build /home/root/build
RUN yarn global add serve
EXPOSE 3000
CMD ["npx", "serve", "-s", "build", "-l", "3000"]
