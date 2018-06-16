# alpine-mongodb
Lightweight MongoDB docker image on alpine

# docker-compose examole with mongo-express
```
version: '3'
services:
  mongodb:
    build: ./mongodb
    restart: always
  mongo-express:
    build: ./mongo-express
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
