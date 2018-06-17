FROM resin/rpi-raspbian:wheezy
LABEL description="This image can be used to run prometheus on ARM v6 chips, e.g. Raspberry Pi Zero"
WORKDIR /tmp
ADD https://github.com/prometheus/prometheus/releases/download/v2.3.0/prometheus-2.3.0.linux-armv6.tar.gz .
WORKDIR /
RUN tar xvf /tmp/prometheus-2.3.0.linux-armv6.tar.gz
WORKDIR /prometheus-2.3.0.linux-armv6
RUN ln prometheus /bin/prometheus
RUN ln promtool /bin/promtool
RUN mkdir /prometheus /etc/prometheus
RUN cp prometheus.yml /prometheus/
RUN cp -r console_libraries/ /etc/prometheus/
RUN cp -r consoles/ /etc/prometheus/
EXPOSE 9090 
VOLUME     [ "/prometheus" ]
WORKDIR    /prometheus
#RUN useradd -r -u 1001 appuser
#RUN chown -R appuser:appuser /prometheus
#USER appuser
ENTRYPOINT [ "/bin/prometheus" ]
CMD        [ "--config.file=/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--web.console.libraries=/etc/prometheus/console_libraries", \
             "--web.console.templates=/etc/prometheus/consoles" ]



