FROM jaidchen/ubuntu-builder:1.0.0 AS build

FROM openhab/openhab:3.4.0.M5-debian
ENV influxdbHome /influxdb
ENV influxdbLocal /openhab/.influxdbv2
ENV influxdbLocalConfig $influxdbLocal/configs
ENV INFLUXD_CONFIG_PATH $influxdbHome/config
ENV INFLUXD_ASSETS_PATH $influxdbHome/assets
ENV INFLUXD_ENGINE_PATH $influxdbHome/engine
ENV INFLUXD_BOLT_PATH $influxdbHome/influx.bolt
ENV INFLUXD_SQLITE_PATH $influxdbHome/influx.sqlite
ENV USER_ID 1000
ENV GROUP_ID 1000
ENV OPENHAB_HTTP_PORT 5300
ENV OPENHAB_HTTPS_PORT ''
ENV CRYPTO_POLICY unlimited
COPY --from=build /etc/influxdb /etc/influxdb
COPY --from=build /etc/init.d/influxdb /etc/init.d/influxdb
COPY --from=build /etc/logrotate.d/influxdb /etc/logrotate.d/influxdb
COPY --from=build /usr/bin/influx /usr/bin/influx
COPY --from=build /usr/bin/influxd /usr/bin/influxd
COPY --from=build /usr/lib/influxdb /usr/lib/influxdb
COPY --from=build /usr/share/influxdb /usr/share/influxdb
COPY --from=build /var/lib/influxdb /var/lib/influxdb
COPY --from=build /var/log/influxdb /var/log/influxdb
COPY --from=build /build/wait-for-it.bash /wait-for-it
COPY --from=build /build/bin/sd /bin/sd
RUN mkdir --parents /etc/cont-init.d
ADD init.bash /etc/cont-init.d/init
COPY template /template
RUN mkdir --parents $influxdbHome
RUN chown $USER_ID:$GROUP_ID $influxdbHome
RUN DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes install libc-bin
VOLUME $influxdbHome