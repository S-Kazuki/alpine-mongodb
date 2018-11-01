# alpine-mongodb
Lightweight MongoDB docker image on alpine

# docker-compose examole with mongo-express
```
version: "3.7"

services:
  mongodb:
    image: skazuki/alpine-mongodb:4.0.3-r0
    restart: always
  mongo-express:
    image: skazuki/alpine-mongo-express:0.49.0
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
