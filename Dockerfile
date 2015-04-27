FROM iojs:slim
MAINTAINER Mark Wolfe <mark@wolfe.id.au>

RUN groupadd -r node && useradd -d /var/lib/node -g node node

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y -q make gcc && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir /tmp/mon && cd /tmp/mon && curl -L# https://github.com/visionmedia/mon/archive/master.tar.gz | tar zx --strip 1 && make install && rm -rf /tmp/mon

COPY . /app
WORKDIR /app
RUN npm install

USER node
EXPOSE 3000
ENTRYPOINT ["mon", "node index.js"]