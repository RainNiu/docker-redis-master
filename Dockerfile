FROM redis:4.0.11-alpine

RUN mkdir /app

COPY . /app/

WORKDIR /app

COPY redis-master.conf /app/data/etc/redis.conf

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone 

RUN sed -i "s/%redispass%/${REDIS_PASSWORD}/" /app/data/etc/redis.conf

CMD [ "redis-server", "/app/data/etc/redis.conf" ]