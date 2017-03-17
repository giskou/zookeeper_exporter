FROM golang:1.7-alpine
COPY . /zookeeper_exporter
WORKDIR /zookeeper_exporter
RUN apk --no-cache add --update git && go get -d && go build && apk del git pcre expat libcurl libssh2
EXPOSE 9114
ENTRYPOINT ["/zookeeper_exporter/zookeeper_exporter"]
