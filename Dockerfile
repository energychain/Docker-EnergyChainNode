FROM ubuntu:16.04
MAINTAINER StromDAO Ltd <kontakt@stromdao.de>
LABEL maintainer="thorsten.zoerner@stromdao.de"
LABEL Description="Energy Blockchain node and API interfaces of Business Object - target audience: developers" Vendor="StromDAO Ltd." Version="1.0"
WORKDIR /app
ADD app /app
RUN /bin/chmod +x /app/bootstrap_node.sh
RUN /bin/chmod +x /app/energychain.sh
RUN /app/bootstrap_node.sh
# setup ENTRYPOINT
EXPOSE 80 8080 8545 8180
ENV NAME StromDAO Node
CMD ["/app/energychain.sh"]


