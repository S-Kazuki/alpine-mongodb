# alpine-mongodb
Lightweight MongoDB docker image on alpine

# docker-compose examole with mongo-express
```
version: "3.7"

services:
  mongodb:
    container_name: mongodb
    image: skazuki/alpine-mongodb
    restart: always
  mongo-express:
    container_name: mongo-express
    image: skazuki/alpine-mongo-express
    restart: always
    environment:
      - ME_CONFIG_MONGODB_SERVER=mongodb
      - VCAP_APP_HOST=0.0.0.0
      - VCAP_APP_PORT=8081
    ports:
      - 8081:8081
    links:
      - mongodb:mongodb
```
