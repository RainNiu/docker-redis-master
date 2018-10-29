#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone 

sed -i "s/%redispass%/${REDIS_PASSWORD}/" /app/data/etc/redis.conf

redis-server /app/data/etc/redis.conf --protected-mode no