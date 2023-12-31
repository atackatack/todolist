FROM golang:1.20.4

RUN go version
ENV GOPATH=/
#install psql
RUN apt-get update
RUN apt-get -y install postgresql-client

COPY ./ ./
RUN go mod download
RUN go build -o app ./cmd/main.go

EXPOSE 8000