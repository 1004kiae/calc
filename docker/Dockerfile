# Build binary
FROM golang:1.14.6 AS builder
WORKDIR /build

ENV CGO_ENABLED=0

COPY go.mod ./
RUN go mod download

COPY . ./
RUN go build -o calc -gcflags "all=-N -l" ./app/main.go

# Install delve
RUN go get -u github.com/go-delve/delve/cmd/dlv

# Run on scratch
FROM alpine:latest
WORKDIR /bin

COPY --from=builder /build/calc /bin/
COPY --from=builder /go/bin/dlv /bin/

EXPOSE 8001
EXPOSE 2345
ENTRYPOINT ["/bin/dlv", "--listen=:2345", "--headless=true", "--api-version=2", "--accept-multiclient", "exec", "/bin/calc", "--continue", "--log"]