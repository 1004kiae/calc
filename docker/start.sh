#!/bin/sh

projectName=$0
gitUrl=$1

sourceRoot="/game/public_html"

# 1. 폴더 생성
mkdir -p "${sourceRoot}"

# 2. 프로젝트 폴더로 이동
cd "${sourceRoot}"
cd "${projectName}"

# 3. 디렉토리 존재 유무 확인
if [[ ! -d "${projectName}" ]]
then
    # 디렉토리가 없는 경우 clone
#    git clone "${gitUrl}" "${sourceRoot}"
    git clone "${gitUrl}"
else
    # 디렉토리가 있는 경우 pull
    git pull "${gitUrl}"
fi


# 4. 프로젝트 빌드
docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp golang:latest go build -o "${projectName}" ./app/main.go

# 5. 고 모듈 vendor 추가
docker run -it --name "${projectName}" golang:latest go mod vendor

docker run -d -p 8000:8000 --name "${projectName}" 75605a415539 go run "${projectName}"










# 4. 고 모듈 다운로드 (여기서부터 다시 체크하기!!)
go.mod ./
go mod download

# 5. 프로젝트 빌드
go build -o "${projectName}" ./elf/app/get.started

#ln -s /build/calc /bin/


