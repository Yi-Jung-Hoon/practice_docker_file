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
