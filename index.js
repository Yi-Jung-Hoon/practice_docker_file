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
