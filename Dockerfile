# Tahap pertama (build)
FROM node:16-alpine as build
WORKDIR /dumbmerch-fe
COPY . /dumbmerch-fe
RUN yarn install

# Tahap kedua
FROM node:16-alpine
COPY --from=build /dumbmerch-fe /dumbmerch-fe
WORKDIR /dumbmerch-fe
EXPOSE 3000
CMD ["yarn", "run", "start"]
