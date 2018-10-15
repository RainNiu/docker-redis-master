#!/bin/bash

apk --no-cache add tzdata && \ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ echo "Asia/Shanghai" > /etc/timezone 

redis-server /app/data/etc/redis.conf --protected-mode no

sed -i "s/%master-ip%/${REDIS_MASTER_IP}/" /app/data/etc/sentinel.conf
sed -i "s/%master-port%/{REDIS_MASTER_PORT}/" /app/data/etc/sentinel.conf
sed -i "s/%slave-num%/{REDIS_SLAVE_NUM}/" /app/data/etc/sentinel.conf

redis-sentinel /app/data/etc/sentinel.conf