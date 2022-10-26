FROM jaidchen/ubuntu-builder:main

# FROM openhab/openhab:3.4.0.M3-debian
# ENV influxdbHome=/influxdb
# ENV INFLUXD_CONFIG_PATH=$influxdbHome/config
# ENV INFLUXD_ASSETS_PATH=$influxdbHome/assets
# ENV INFLUXD_BOLT_PATH=$influxdbHome/influx.bolt
# ENV INFLUXD_SQLITE_PATH=$influxdbHome/influx.sqlite
# ENV USER_ID=1000
# ENV GROUP_ID=1000
# ENV CRYPTO_POLICY=unlimited
# ENV USER_ID=1000
# ENV GROUP_ID=1000
# ENV OPENHAB_HTTP_PORT=5300
# ENV INFLUXD_HOME=/influxdb
# ENV INFLUXD_CONFIG_PATH=/influxdb/config
# ENV INFLUXD_ASSETS_PATH=/influxdb/assets
# ENV INFLUXD_BOLT_PATH=/influxdb/influx.bolt
# ENV INFLUXD_SQLITE_PATH=/influxdb/influx.sqlite
# ENV INFLUXD_ENGINE_PATH=/influxdb/engine
# COPY --from=build /etc/influxdb /etc/influxdb
# COPY --from=build /etc/init.d/influxdb /etc/init.d/influxdb
# COPY --from=build /etc/logrotate.d/influxdb /etc/logrotate.d/influxdb
# COPY --from=build /usr/bin/influx /usr/bin/influx
# COPY --from=build /usr/bin/influxd /usr/bin/influxd
# COPY --from=build /usr/lib/influxdb /usr/lib/influxdb
# COPY --from=build /usr/share/influxdb /usr/share/influxdb
# COPY --from=build /var/lib/influxdb /var/lib/influxdb
# COPY --from=build /var/log/influxdb /var/log/influxdb
# COPY --from=build /build/wait-for-it.bash /wait-for-it
# COPY run.bash /bin
# COPY template /template
# RUN mkdir --parents $INFLUXD_HOME
# RUN /bin/su 1000 -c 'influxd & sleep 2 ; influx setup --force --org openhab --bucket default --username openhab --password habopen_________'
# RUN chown --recursive $USER_ID:$GROUP_ID $INFLUXD_HOME
# ENTRYPOINT ["/bin/bash", "/bin/run.bash"]