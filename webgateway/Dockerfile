FROM docker.iscinternal.com/intersystems/webgateway:2020.3.0-latest

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh
ENTRYPOINT  ["/entrypoint.sh"]