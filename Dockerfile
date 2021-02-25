FROM golang:1.16.0-alpine3.13 as build

WORKDIR /go/src/app
COPY . .

RUN go build hello.go

FROM scratch
COPY --from=build /go/src/app/hello /usr/bin/
ENTRYPOINT [ "/usr/bin/hello" ]
