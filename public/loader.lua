// ================================================
//  VSS — Virtual Script Storage Protection
//  Chạy: npm install express && node vss.js
// ================================================

const express = require("express");

const app = express();
const PORT = 3000;

// =============================================
//  SCRIPTS NHÚNG TRỰC TIẾP — Thêm vào đây
// =============================================

const SCRIPTS = {

  // =============================================
  //  THÊM SCRIPT CỦA BẠN VÀO ĐÂY
  //  Cú pháp: ten: `code lua của bạn`,
  // =============================================

  myscript: `
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/05202a6a652c8550230232c7e8d0d005504075e14d027a1c29b5709db0cc92ee/download"))()
`,

};



// =============================================
//  TRANG ACCESS DENIED (HTML nhúng sẵn)
// =============================================

const ACCESS_DENIED_HTML = `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Access Denied — VSS</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&family=Syne:wght@400;600;800&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
  :root {
    --bg: #0a0b10; --surface: #111318; --border: #1e2130;
    --red: #e05252; --red-dim: #3a1a1a; --purple: #7c6af7;
    --text: #c8ccd8; --muted: #555970;
  }
  body {
    background: var(--bg); color: var(--text);
    font-family: 'Syne', sans-serif; min-height: 100vh;
    display: flex; align-items: center; justify-content: center;
    overflow: hidden; position: relative;
  }
  body::before {
    content: ''; position: fixed; inset: 0;
    background-image:
      linear-gradient(rgba(255,255,255,0.015) 1px, transparent 1px),
      linear-gradient(90deg, rgba(255,255,255,0.015) 1px, transparent 1px);
    background-size: 40px 40px; pointer-events: none;
  }
  body::after {
    content: ''; position: fixed; top: 50%; left: 50%;
    transform: translate(-50%, -60%); width: 600px; height: 600px;
    background: radial-gradient(circle, rgba(224,82,82,0.06) 0%, transparent 70%);
    pointer-events: none;
  }
  .card {
    position: relative; z-index: 1; background: var(--surface);
    border: 1px solid var(--border); border-radius: 16px;
    padding: 48px 40px; max-width: 480px; width: 90%; text-align: center;
    animation: fadeUp 0.6s cubic-bezier(0.16,1,0.3,1) both;
    box-shadow: 0 0 0 1px rgba(255,255,255,0.03), 0 32px 64px rgba(0,0,0,0.5);
  }
  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(24px); }
    to   { opacity: 1; transform: translateY(0); }
  }
  .icon-wrap {
    width: 72px; height: 72px; border-radius: 50%;
    background: var(--red-dim); border: 1px solid rgba(224,82,82,0.2);
    display: flex; align-items: center; justify-content: center;
    margin: 0 auto 24px; animation: pulse 3s ease-in-out infinite;
  }
  @keyframes pulse {
    0%, 100% { box-shadow: 0 0 0 0 rgba(224,82,82,0.2); }
    50%       { box-shadow: 0 0 0 12px rgba(224,82,82,0); }
  }
  .icon-wrap svg { width: 32px; height: 32px; color: var(--red); }
  h1 { font-size: 28px; font-weight: 800; color: var(--red); letter-spacing: -0.5px; margin-bottom: 10px; }
  .subtitle { font-size: 14px; color: var(--muted); line-height: 1.6; margin-bottom: 28px; font-family: 'Space Mono', monospace; }
  .info-box { background: #0d0e14; border: 1px solid var(--border); border-radius: 10px; padding: 20px; margin-bottom: 24px; text-align: left; }
  .info-box .label { font-size: 10px; font-weight: 700; letter-spacing: 2px; color: var(--red); margin-bottom: 10px; display: flex; align-items: center; gap: 6px; }
  .info-box p { font-size: 12px; color: var(--muted); line-height: 1.7; font-family: 'Space Mono', monospace; }
  .badge { display: inline-block; background: rgba(224,82,82,0.12); border: 1px solid rgba(224,82,82,0.25); color: var(--red); font-size: 11px; font-family: 'Space Mono', monospace; padding: 5px 12px; border-radius: 20px; margin-bottom: 28px; }
  .branding { border-top: 1px solid var(--border); padding-top: 20px; margin-top: 4px; }
  .branding .name { font-size: 16px; font-weight: 800; color: var(--purple); letter-spacing: 1px; }
  .branding .tagline { font-size: 11px; color: var(--muted); font-family: 'Space Mono', monospace; margin-top: 3px; }
  .dot { display: inline-block; width: 6px; height: 6px; border-radius: 50%; background: var(--red); vertical-align: middle; }
</style>
</head>
<body>
<div class="card">
  <div class="icon-wrap">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <path d="M10.29 3.86L1.82 18a2 2 0 001.71 3h16.94a2 2 0 001.71-3L13.71 3.86a2 2 0 00-3.42 0z"/>
      <line x1="12" y1="9" x2="12" y2="13"/>
      <line x1="12" y1="17" x2="12.01" y2="17"/>
    </svg>
  </div>
  <h1>Access Denied</h1>
  <p class="subtitle">This script is protected and cannot be<br>viewed or copied from a browser.</p>
  <div class="info-box">
    <div class="label"><span class="dot"></span> PROTECTED CONTENT</div>
    <p>This endpoint serves Lua scripts exclusively to authorized executors. Browser access is restricted to prevent unauthorized copying or viewing of protected scripts.</p>
  </div>
  <div class="badge">Browser access is not allowed</div>
  <div class="branding">
    <div class="name">My VSS</div>
    <div class="tagline">Virtual Script Storage Protection</div>
  </div>
</div>
</body>
</html>`;

// =============================================
//  MIDDLEWARE BẢO VỆ
// =============================================

function checkAccess(req, res, next) {
  const ua = req.headers["user-agent"] || "";

  const browserKeywords = ["Mozilla", "Chrome", "Safari", "Firefox", "Edge", "Opera"];
  const isBrowser = browserKeywords.some((kw) => ua.includes(kw));

  if (isBrowser) return res.status(403).send(ACCESS_DENIED_HTML);

  next();
}

// =============================================
//  ROUTES
// =============================================

// Browser → Access Denied
app.get("/", (req, res) => res.send(ACCESS_DENIED_HTML));

// Lấy script (được bảo vệ)
app.get("/script/:id", checkAccess, (req, res) => {
  const id = req.params.id.replace(/[^a-zA-Z0-9_-]/g, "");
  const script = SCRIPTS[id];

  if (!script) return res.status(404).json({ error: "Script not found." });

  res.setHeader("Content-Type", "text/plain");
  res.setHeader("X-Protected", "true");
  res.send(script);
});

// =============================================
//  KHỞI ĐỘNG
// =============================================

app.listen(PORT, () => {
  console.log(`\n✅  VSS Server chạy tại http://localhost:${PORT}`);
  console.log(`📜  Scripts: ${Object.keys(SCRIPTS).join(", ")}`);
  console.log(`🔓  Mọi executor đều được phép truy cập`);
  console.log(`\n── Cách dùng ──────────────────────────────`);
  console.log(`  Lấy script : GET  /script/:id`);
  console.log(`────────────────────────────────────────────\n`);
});
