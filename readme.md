# 실습

## 1. 프로젝트 디렉토리 생성

```bash
mkdir my-node-app
cd my-node-app
```

## 2. Node.js 애플리케이션 설정

```bash
npm init -y # package.json 파일을 생성하고, 기본 설정을 추가합니다.
```

- `index.js` 파일을 생성하고, 간단한 웹 서버 코드를 작성합니다.

```bash
// index.js
const express = require("express");
const app = express();
const port = 3000;

// 환경 변수 읽기
const dbHost = process.env.DB_HOST;
const dbUser = process.env.DB_USER;
const dbPassword = process.env.DB_PASSWORD;

app.get("/", (req, res) => {
  res.send("Hello, Docker!");
});

app.listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
  console.log(`DB Host: ${dbHost}`);
  console.log(`DB User: ${dbUser}`);
  console.log(`DB Password: ${dbPassword}`);
});
```

- `express` 패키지를 설치합니다.

```bash
npm install express
```

## 3. Dockerfile 작성

```bash
# Dockerfile
# 1. 베이스 이미지로 Node.js 사용
FROM node:14

# 2. 작업 디렉토리 설정
WORKDIR /usr/src/app

# 3. package.json과 package-lock.json을 복사하고 종속성 설치
COPY package*.json ./
RUN npm install

# 4. 나머지 애플리케이션 코드 복사
COPY . .

# 5. 애플리케이션이 사용할 포트 노출, 문서화 목적
EXPOSE 3000

# 6. 환경변수설정
ENV DB_HOST=localhost
ENV DB_USER=myapp
ENV DB_PASSWORD=secret

# 7. 애플리케이션 시작 명령어
CMD ["node", "index.js"]
```

## 4. Docker 이미지 빌드

```bash
# 현재 디렉터리에 있는 Dockerfile을 사용하여 my-node-app이라는 
# 이름의 Docker 이미지를 빌드
docker build -t my-node-app .
```

## 5. Docker 컨테이너 실행

```bash
docker run -p 3000:3000 my-node-app
```

## 6. 애플리케이션 테스트

웹 브라우저에서 `http://localhost:3000`으로 이동하여 "Hello, Docker!" 메시지를 확인합니다.

## 7. Docker 컨테이너 관리

```bash
docker ps
docker stop <CONTAINER_ID>
docker rm <CONTAINER_ID>
```