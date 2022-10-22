FROM jaidchen/ubuntu-builder:main AS build

FROM openhab/openhab:3.4.0.M3-debian AS openhab
ENV CRYPTO_POLICY=unlimited
ENV USER_ID=1000
ENV GROUP_ID=1000
ENV OPENHAB_HTTP_PORT=5300
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
COPY run.bash /bin
COPY template /template
ENTRYPOINT ["/bin/bash", "/bin/run.bash"]