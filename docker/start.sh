#!/bin/sh

projectName=$0
gitUrl=$1

sourceRoot="/game/public_html"

# 1. 폴더 생성
mkdir -p "${sourceRoot}"

# 2. 디렉토리 존재 유무 확인
if [[ ! -d "${projectName}" ]]
then
    # 디렉토리가 없는 경우 clone
    git clone "${gitUrl}" "${sourceRoot}"
else
    # 디렉토리가 있는 경우 pull
    git pull "${gitUrl}" "${sourceRoot}"
fI

# 3. 프로젝트 폴더로 이동
cd "${sourceRoot}"
cd "${projectName}"

# 4. 고 모듈 다운로드 (여기서부터 다시 체크하기!!)
go.mod ./
go mod download

# 5. 프로젝트 빌드
go build -o "${projectName}" ./elf/app/get.started

ln -s /build/calc /bin/





#WORKDIR /build
#WORKDIR /bin
#
### 전체 표준 라이브러리를 다시 빌드
##ENV CGO_ENABLED=0
#
#COPY go.mod ./
#RUN go mod download
#
#COPY . ./
#RUN go build -o calc ./app/main.go
#
## Run on scratch
#FROM alpine:latest
#
#COPY --from=builder /build/calc /bin/
#
#EXPOSE 8000
