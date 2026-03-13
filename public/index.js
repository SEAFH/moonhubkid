const fs = require('fs');
const path = require('path');

export default function handler(req, res) {
  const ua = req.headers['user-agent'] || '';

  // Roblox executor → trả script
  if (ua.includes('Roblox')) {
    res.setHeader('Content-Type', 'text/plain; charset=utf-8');
    res.status(200).send('loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/05202a6a652c8550230232c7e8d0d005504075e14d027a1c29b5709db0cc92ee/download"))()');
    return;
  }

  // Trình duyệt → đọc và trả index.html
  const html = fs.readFileSync(path.join(process.cwd(), 'index.html'), 'utf8');
  res.setHeader('Content-Type', 'text/html; charset=utf-8');
  res.status(200).send(html);
}
