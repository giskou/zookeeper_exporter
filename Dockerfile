FROM golang as build

COPY . /build
WORKDIR /build

RUN go get -d
RUN go build -o zookeeper_exporter

FROM gcr.io/distroless/base

COPY --from=build /build/zookeeper_exporter /bin/zookeeper_exporter

EXPOSE 9114
ENTRYPOINT ["/bin/zookeeper_exporter"]
