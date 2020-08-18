# calc

## 테스트 방법
1. docker-compose 로 docker container 실행
2. go Remote 설정 (localhost:2345) 후 디버깅 모드 실행
3. `curl`을 사용하여 서버에 요청 테스트 
```go
curl 'localhost:8001/fib?num=1000'
```
<br />
<br />
<br />
<br />

## 현재 버그 상황.... ㅠ

![elf.design.flow](docs/error.png)