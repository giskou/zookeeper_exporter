FROM golang:1.7.4
COPY . /zookeeper_exporter
WORKDIR /zookeeper_exporter
RUN go get -d
RUN go build
EXPOSE 9114
ENTRYPOINT ["/zookeeper_exporter/zookeeper_exporter"]
