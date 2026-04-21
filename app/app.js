const http = require('http');

const PORT = 3000;

http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end("Welcome to TKXEL DevOps App 🚀\n");
}).listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
