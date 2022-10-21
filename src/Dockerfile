FROM jaidchen/ubuntu-builder:main AS buildInflux

FROM openhab/openhab:3.3.0-debian AS openhab
COPY --from=buildInflux /etc/influxdb /etc/influxdb
COPY --from=buildInflux /etc/init.d/influxdb /etc/init.d/influxdb
COPY --from=buildInflux /etc/logrotate.d/influxdb /etc/logrotate.d/influxdb
COPY --from=buildInflux /usr/bin/influx /usr/bin/influx
COPY --from=buildInflux /usr/bin/influxd /usr/bin/influxd
COPY --from=buildInflux /usr/lib/influxdb /usr/lib/influxdb
COPY --from=buildInflux /usr/share/influxdb /usr/share/influxdb
COPY --from=buildInflux /var/lib/influxdb /var/lib/influxdb
COPY --from=buildInflux /var/log/influxdb /var/log/influxdb
COPY run.bash /bin
COPY template /template
ENV CRYPTO_POLICY=unlimited
ENV USER_ID=1000
ENV GROUP_ID=1000
ENV OPENHAB_HTTP_PORT=5300
ENTRYPOINT ["/bin/bash", "/bin/run.bash"]
CMD []