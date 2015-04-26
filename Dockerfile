FROM iojs:slim
MAINTAINER Mark Wolfe <mark@wolfe.id.au>

RUN groupadd -r node && useradd -d /var/lib/node -g node node

RUN touch /etc/inittab
RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y -q runit && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/service/iojs-dockerapp
COPY ./etc/run /etc/service/iojs-dockerapp/run
RUN chmod 755 /etc/service/iojs-dockerapp/run
COPY ./etc/runit_bootstrap /usr/sbin/runit_bootstrap
RUN chmod 755 /usr/sbin/runit_bootstrap

COPY . /app
WORKDIR /app
RUN npm install

EXPOSE 3000
ENTRYPOINT ["/usr/sbin/runit_bootstrap"]