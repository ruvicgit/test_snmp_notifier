FROM        quay.io/prometheus/busybox:latest
LABEL       maintainer="Maxime Wojtczak <maxime.wojtczak@zenika.com>"

RUN mkdir -p /etc/snmp_notifier
COPY snmp_notifier  /bin/snmp_notifier
COPY description-template.tpl  /etc/snmp_notifier/description-template.tpl

EXPOSE      9464
RUN chmod +x /bin/snmp_notifier
RUN chmod +r /etc/snmp_notifier/description-template.tpl
ENTRYPOINT  [ "/bin/snmp_notifier" ]
CMD ["--snmp.trap-description-template=/etc/snmp_notifier/description-template.tpl"]
