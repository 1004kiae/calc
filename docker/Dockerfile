# Build binary
FROM golang:1.14.6 AS builder
#WORKDIR /game
#WORKDIR public_html
WORKDIR /build
WORKDIR /bin

ENTRYPOINT ["start.sh", "elf", "https://github.com/1004kiae/calc.git"]