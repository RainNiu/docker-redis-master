FROM redis:4.0.11

RUN mkdir /app

COPY . /app/

WORKDIR /app

RUN apk --no-cache add tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone

COPY redis-master.conf /app/data/etc/redis.conf
COPY sentinel.conf /app/data/etc/sentinel.conf

COPY run.sh /app/run.sh

ENTRYPOINT [ "/app/run.sh" ]