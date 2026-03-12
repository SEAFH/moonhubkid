<?php
// --- 1. CẤU HÌNH SCRIPT JNKIE CỦA BẠN ---
$JNKIE_SCRIPT = 'loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/05202a6a652c8550230232c7e8d0d005504075e14d027a1c29b5709db0cc92ee/download"))()';

// --- 2. LOGIC KIỂM TRA (CHẶN RAW) ---
$ua = $_SERVER['HTTP_USER_AGENT'] ?? '';
if (strpos($ua, 'Roblox') !== false) {
    header('Content-Type: text/plain; charset=utf-8');
    echo $JNKIE_SCRIPT;
    exit;
}

// --- 3. GIAO DIỆN MOON™ (KHI MỞ BẰNG TRÌNH DUYỆT) ---
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>moon™</title>
  <link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@800;900&family=DM+Mono:wght@400;500&family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet"/>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --purple: #a855f7;
      --purple-light: #c084fc;
      --purple-dim: #7c3aed;
      --purple-glow: rgba(168, 85, 247, 0.35);
      --bg: #0a0a0f;
      --surface: #111118;
      --border: rgba(168, 85, 247, 0.18);
      --text: #e2e8f0;
      --muted: #94a3b8;
    }

    html, body {
      min-height: 100%;
      background: var(--bg);
      color: var(--text);
      font-family: 'DM Sans', sans-serif;
    }

    body::before {
      content: '';
      position: fixed;
      inset: 0;
      background:
        radial-gradient(ellipse 70% 55% at 50% 10%, rgba(120, 40, 220, 0.28) 0%, transparent 70%),
        radial-gradient(ellipse 40% 35% at 20% 80%, rgba(90, 20, 180, 0.15) 0%, transparent 60%),
        radial-gradient(ellipse 40% 35% at 80% 70%, rgba(160, 60, 240, 0.12) 0%, transparent 60%);
      pointer-events: none;
      z-index: 0;
    }

    body::after {
      content: '';
      position: fixed;
      inset: 0;
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.85' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
      background-size: 180px;
      pointer-events: none;
      z-index: 0;
      opacity: 0.5;
    }

    nav {
      position: relative;
      z-index: 10;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 18px 40px;
      border-bottom: 1px solid var(--border);
      background: rgba(10, 10, 15, 0.6);
      backdrop-filter: blur(12px);
    }

    .nav-logo {
      display: flex;
      align-items: center;
      gap: 10px;
      font-family: 'Urbanist', sans-serif;
      font-size: 1.1rem;
      font-weight: 800;
      color: var(--text);
      text-decoration: none;
    }

    .moon-icon {
      width: 28px;
      height: 28px;
      background: linear-gradient(135deg, var(--purple), var(--purple-dim));
      border-radius: 50%;
      box-shadow: 0 0 14px var(--purple-glow);
      position: relative;
      overflow: hidden;
    }
    .moon-icon::after {
      content: '';
      position: absolute;
      top: 3px; right: 3px;
      width: 18px; height: 18px;
      background: var(--bg);
      border-radius: 50%;
    }

    .nav-purchase {
      font-size: 0.875rem;
      color: var(--muted);
      text-decoration: none;
      transition: color 0.2s;
      letter-spacing: 0.02em;
    }
    .nav-purchase:hover { color: var(--purple-light); }

    main {
      position: relative;
      z-index: 1;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 90px 20px 60px;
      text-align: center;
    }

    .wordmark {
      font-family: 'Urbanist', sans-serif;
      font-size: clamp(4.5rem, 11vw, 8rem);
      font-weight: 900;
      line-height: 0.95;
      letter-spacing: -0.04em;
      background: linear-gradient(160deg, #d8b4fe 0%, var(--purple) 45%, var(--purple-dim) 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      filter: drop-shadow(0 0 40px rgba(168, 85, 247, 0.5));
      animation: fadeUp 0.7s ease both;
    }

    .wordmark sup {
      font-size: 0.28em;
      vertical-align: super;
      letter-spacing: 0;
      opacity: 0.85;
    }

    .tagline {
      margin-top: 22px;
      font-size: clamp(0.95rem, 2.2vw, 1.2rem);
      color: var(--muted);
      letter-spacing: 0.01em;
      animation: fadeUp 0.7s 0.1s ease both;
    }

    #game-name {
      display: inline-block;
      color: var(--purple-light);
      font-weight: 500;
      transition: opacity 0.3s, transform 0.3s;
    }
    #game-name.fade-out {
      opacity: 0;
      transform: translateY(-6px);
    }
    #game-name.fade-in {
      opacity: 1;
      transform: translateY(0);
    }

    .code-box {
      margin-top: 36px;
      display: flex;
      align-items: center;
      gap: 14px;
      background: rgba(20, 16, 35, 0.7);
      border: 1px solid var(--border);
      border-radius: 10px;
      padding: 14px 18px 14px 22px;
      backdrop-filter: blur(10px);
      box-shadow: 0 0 0 1px rgba(168, 85, 247, 0.06), inset 0 1px 0 rgba(255,255,255,0.04);
      animation: fadeUp 0.7s 0.2s ease both;
      max-width: 560px;
      width: 100%;
    }

    .code-text {
      font-family: 'DM Mono', monospace;
      font-size: 0.82rem;
      color: #c4b5fd;
      white-space: normal;
      word-break: break-all;
      flex: 1;
      text-align: left;
    }

    .code-text .kw  { color: #7dd3fc; }
    .code-text .str { color: #a78bfa; }

    .copy-btn {
      background: none;
      border: 1px solid var(--border);
      border-radius: 6px;
      width: 32px; height: 32px;
      cursor: pointer;
      display: flex; align-items: center; justify-content: center;
      flex-shrink: 0;
      transition: border-color 0.2s, background 0.2s;
      color: var(--muted);
    }
    .copy-btn:hover {
      border-color: var(--purple);
      background: rgba(168, 85, 247, 0.12);
      color: var(--purple-light);
    }

    .btn-row {
      margin-top: 28px;
      display: flex;
      gap: 14px;
      flex-wrap: wrap;
      justify-content: center;
      animation: fadeUp 0.7s 0.3s ease both;
    }

    .btn-primary {
      display: inline-block;
      text-decoration: none;
      background: linear-gradient(135deg, var(--purple) 0%, var(--purple-dim) 100%);
      color: #fff;
      border: none;
      border-radius: 8px;
      padding: 13px 30px;
      font-family: 'DM Sans', sans-serif;
      font-size: 0.95rem;
      font-weight: 700;
      cursor: pointer;
      letter-spacing: 0.01em;
      box-shadow: 0 0 24px rgba(168, 85, 247, 0.5), 0 4px 14px rgba(0,0,0,0.3);
      transition: transform 0.15s, box-shadow 0.15s;
    }
    .btn-primary:hover {
      transform: translateY(-2px);
      box-shadow: 0 0 36px rgba(168, 85, 247, 0.7), 0 6px 20px rgba(0,0,0,0.35);
    }
    .btn-primary:active { transform: translateY(0); }

    .btn-secondary {
      background: transparent;
      color: var(--text);
      border: 1px solid rgba(168, 85, 247, 0.4);
      border-radius: 8px;
      padding: 13px 30px;
      font-family: 'DM Sans', sans-serif;
      font-size: 0.95rem;
      font-weight: 600;
      cursor: pointer;
      letter-spacing: 0.01em;
      transition: border-color 0.2s, background 0.2s, transform 0.15s;
    }
    .btn-secondary:hover {
      border-color: var(--purple);
      background: rgba(168, 85, 247, 0.08);
      transform: translateY(-2px);
    }

    .keyless-note {
      margin-top: 14px;
      font-size: 0.82rem;
      font-weight: 700;
      color: var(--purple-light);
      letter-spacing: 0.04em;
      text-transform: lowercase;
      animation: fadeUp 0.7s 0.35s ease both;
    }

    .discord-card {
      margin-top: 52px;
      width: 100%;
      max-width: 380px;
      background: rgba(16, 12, 30, 0.75);
      border: 1px solid var(--border);
      border-radius: 14px;
      padding: 26px 28px 22px;
      backdrop-filter: blur(14px);
      box-shadow: 0 0 0 1px rgba(168,85,247,0.06), 0 20px 60px rgba(0,0,0,0.4);
      animation: fadeUp 0.7s 0.45s ease both;
    }

    .discord-header {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      font-family: 'Syne', sans-serif;
      font-size: 1rem;
      font-weight: 700;
      color: var(--text);
      margin-bottom: 14px;
    }

    .discord-logo {
      width: 22px; height: 22px;
      fill: #7289da;
    }

    .discord-stats {
      display: flex;
      justify-content: center;
      gap: 20px;
      font-size: 0.8rem;
      color: var(--muted);
      margin-bottom: 18px;
    }

    .stat-online::before {
      content: '● ';
      color: #4ade80;
    }

    .discord-join {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      width: 100%;
      background: #5865f2;
      color: #fff;
      border: none;
      border-radius: 8px;
      padding: 12px;
      font-family: 'DM Sans', sans-serif;
      font-size: 0.9rem;
      font-weight: 600;
      cursor: pointer;
      transition: background 0.2s, transform 0.15s;
      text-decoration: none;
    }
    .discord-join:hover {
      background: #4752c4;
      transform: translateY(-1px);
    }

    .discord-caption {
      margin-top: 12px;
      font-size: 0.75rem;
      color: rgba(148, 163, 184, 0.55);
    }

    .games-section {
      position: relative;
      z-index: 1;
      max-width: 780px;
      margin: 0 auto;
      padding: 60px 20px 20px;
      text-align: center;
    }

    .games-title {
      font-family: 'Urbanist', sans-serif;
      font-size: 2rem;
      font-weight: 900;
      color: var(--text);
      letter-spacing: -0.02em;
      margin-bottom: 10px;
    }

    .games-sub {
      font-size: 0.9rem;
      color: var(--muted);
      margin-bottom: 36px;
    }

    .games-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
      gap: 12px;
    }

    .game-card {
      background: rgba(20, 16, 35, 0.6);
      border: 1px solid var(--border);
      border-radius: 10px;
      padding: 16px 18px;
      font-family: 'DM Sans', sans-serif;
      font-size: 0.9rem;
      font-weight: 600;
      color: var(--text);
      backdrop-filter: blur(8px);
      transition: border-color 0.2s, transform 0.15s, background 0.2s;
      cursor: default;
    }
    .game-card:hover {
      border-color: var(--purple);
      background: rgba(168, 85, 247, 0.08);
      transform: translateY(-2px);
    }
    .game-card--highlight {
      border-color: rgba(168, 85, 247, 0.5);
      background: rgba(168, 85, 247, 0.1);
      color: var(--purple-light);
    }

    .faq-section {
      position: relative;
      z-index: 1;
      max-width: 780px;
      margin: 0 auto;
      padding: 60px 20px 80px;
      text-align: center;
    }

    .faq-title {
      font-family: 'Urbanist', sans-serif;
      font-size: 2rem;
      font-weight: 900;
      color: var(--text);
      letter-spacing: -0.02em;
      margin-bottom: 10px;
    }

    .faq-sub {
      font-size: 0.9rem;
      color: var(--muted);
      margin-bottom: 36px;
    }

    .faq-link {
      color: var(--purple-light);
      text-decoration: none;
    }
    .faq-link:hover { text-decoration: underline; }

    .faq-list {
      display: flex;
      flex-direction: column;
      gap: 12px;
      text-align: left;
    }

    .faq-item { width: 100%; }

    .faq-btn {
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: space-between;
      background: rgba(20, 16, 35, 0.6);
      border: 1px solid var(--border);
      border-radius: 10px;
      padding: 18px 22px;
      color: var(--text);
      font-family: 'DM Sans', sans-serif;
      font-size: 0.95rem;
      font-weight: 700;
      cursor: pointer;
      transition: border-color 0.2s, background 0.2s;
      backdrop-filter: blur(8px);
    }
    .faq-btn:hover {
      border-color: var(--purple);
      background: rgba(168, 85, 247, 0.06);
    }

    .faq-arrow {
      color: var(--purple);
      font-size: 0.75rem;
      transition: transform 0.25s;
      flex-shrink: 0;
    }
    .faq-btn.open .faq-arrow { transform: rotate(180deg); }

    .faq-answer {
      display: grid;
      grid-template-rows: 0fr;
      transition: grid-template-rows 0.3s ease, padding 0.3s ease;
      overflow: hidden;
      font-size: 0.875rem;
      color: var(--muted);
      border: 1px solid var(--border);
      border-top: none;
      border-radius: 0 0 10px 10px;
      background: rgba(14, 10, 25, 0.5);
      line-height: 1.6;
      padding: 0 22px;
    }
    .faq-answer > div {
      overflow: hidden;
    }
    .faq-answer.open {
      grid-template-rows: 1fr;
      padding: 14px 22px 18px;
    }

    footer {
      position: relative;
      z-index: 1;
      border-top: 1px solid var(--border);
      padding: 28px 40px 36px;
    }

    .footer-top {
      display: flex;
      align-items: center;
      justify-content: space-between;
      flex-wrap: wrap;
      gap: 12px;
      margin-bottom: 20px;
    }

    .footer-logo {
      display: flex;
      align-items: center;
      gap: 8px;
      font-family: 'Urbanist', sans-serif;
      font-size: 0.95rem;
      font-weight: 800;
      color: var(--text);
    }

    .footer-logo .moon-icon {
      width: 22px; height: 22px;
    }
    .footer-logo .moon-icon::after {
      width: 14px; height: 14px;
      top: 2px; right: 2px;
    }

    .footer-powered {
      font-size: 0.82rem;
      color: var(--muted);
    }
    .footer-brand {
      color: var(--purple-light);
      font-weight: 700;
    }

    .footer-divider {
      height: 1px;
      background: var(--border);
      margin-bottom: 20px;
    }

    .footer-legal {
      text-align: center;
    }
    .footer-legal-title {
      font-size: 0.8rem;
      font-weight: 700;
      color: var(--text);
      margin-bottom: 8px;
    }
    .footer-legal p {
      font-size: 0.72rem;
      color: rgba(148, 163, 184, 0.45);
      line-height: 1.6;
      margin-bottom: 4px;
    }

    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(18px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    .particles {
      position: fixed;
      inset: 0;
      pointer-events: none;
      z-index: 0;
      overflow: hidden;
    }

    .particle {
      position: absolute;
      border-radius: 50%;
      background: radial-gradient(circle, rgba(168,85,247,0.6) 0%, transparent 70%);
      animation: float linear infinite;
    }

    @keyframes float {
      from { transform: translateY(110vh) scale(0.5); opacity: 0; }
      10%  { opacity: 1; }
      90%  { opacity: 0.6; }
      to   { transform: translateY(-10vh) scale(1.2); opacity: 0; }
    }
  </style>
</head>
<body>

  <div class="particles" id="particles"></div>

  <nav>
    <a class="nav-logo" href="#">
      <div class="moon-icon"></div>
      moon™
    </a>
  </nav>

  <main>
    <h1 class="wordmark">moon<sup>™</sup></h1>
    <p class="tagline">the only <span id="game-name">The Forge</span> script you'll need</p>

    <div class="code-box">
      <span class="code-text">
        <span class="kw">loadstring</span>(game:<span class="kw">HttpGet</span>(<span class="str">"https://moon-hub-eight.vercel.app/loader.lua"</span>))()
      </span>
      <button class="copy-btn" title="Copy" onclick="copyCode(this)">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <rect x="9" y="9" width="13" height="13" rx="2"/><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/>
        </svg>
      </button>
    </div>

    <div class="btn-row">
      <a href="https://jnkie.com/flow/56bf490f-de1f-4312-8638-f965b86fb982" target="_blank" class="btn-primary">get key</a>
      <button class="btn-secondary" onclick="document.getElementById('games').scrollIntoView({behavior:'smooth'})">request a game</button>
    </div>
    <p class="keyless-note">get key fast and easy</p>
  </main>

  <section class="games-section" id="games">
    <h2 class="games-title">supported games</h2>
    <p class="games-sub">All games currently supported by moon™</p>
    <div class="games-grid">
      <div class="game-card">🎣 Ficsh</div>
      <div class="game-card">⚔️ Blox Fruits</div>
      <div class="game-card">🚂 Dead Rails</div>
      <div class="game-card">🌲 99 Night In The Forest</div>
      <div class="game-card">🧠 Steal a Brainrot</div>
      <div class="game-card">🌸 Garden Horizon</div>
      <div class="game-card">🚪 Doors</div>
      <div class="game-card">⚒️ The Forge</div>
    </div>
  </section>

  <section class="faq-section">
    <h2 class="faq-title">faq</h2>
    <p class="faq-sub">The full FAQ is in the <a href="#" class="faq-link">Discord Server</a></p>

    <div class="faq-list">
      <div class="faq-item">
        <button class="faq-btn" onclick="toggleFaq(this)">
          <span>how do i get a key?</span>
          <span class="faq-arrow">▼</span>
        </button>
        <div class="faq-answer"><div>Click the "get key" button above and complete the steps to receive your key.</div></div>
      </div>
      <div class="faq-item">
        <button class="faq-btn" onclick="toggleFaq(this)">
          <span>does this work on mobile?</span>
          <span class="faq-arrow">▼</span>
        </button>
        <div class="faq-answer"><div>Mobile support depends on your executor. Check our Discord for the latest compatibility info.</div></div>
      </div>
      <div class="faq-item">
        <button class="faq-btn" onclick="toggleFaq(this)">
          <span>what games are supported?</span>
          <span class="faq-arrow">▼</span>
        </button>
        <div class="faq-answer"><div>We support a wide range of games. Use the "request a game" button to suggest new ones.</div></div>
      </div>
      <div class="faq-item">
        <button class="faq-btn" onclick="toggleFaq(this)">
          <span>how do i review the script?</span>
          <span class="faq-arrow">▼</span>
        </button>
        <div class="faq-answer"><div>Join our Discord server to leave feedback and reviews for the script.</div></div>
      </div>
    </div>
  </section>

  <footer>
    <div class="footer-top">
      <div class="footer-logo">
        <div class="moon-icon"></div>
        moon™
      </div>
      <span class="footer-powered">site powered by <span class="footer-brand">moon™</span></span>
    </div>
    <div class="footer-divider"></div>
    <div class="footer-legal">
      <p class="footer-legal-title">Important Legal Disclaimer</p>
      <p>moon™ is an independent third-party service and is not related to cheating, hacking, or any violations of Roblox Terms of Service. Use of our services is at your own discretion and risk.</p>
      <p>All product names, logos, and brands are property of their respective owners.</p>
    </div>
  </footer>

  <script>
    const games = ['The Forge', 'Ficsh', 'Blox Fruits', 'Dead Rails', '99 Night In The Forest', 'Steal a Brainrot', 'Garden Horizon', 'Doors'];
    let gameIndex = 0;
    const gameEl = document.getElementById('game-name');
    setInterval(() => {
      gameEl.classList.add('fade-out');
      setTimeout(() => {
        gameIndex = (gameIndex + 1) % games.length;
        gameEl.textContent = games[gameIndex];
        gameEl.classList.remove('fade-out');
      }, 300);
    }, 2000);

    function toggleFaq(btn) {
      btn.classList.toggle('open');
      const answer = btn.nextElementSibling;
      answer.classList.toggle('open');
    }

    function copyCode(btn) {
      navigator.clipboard.writeText('loadstring(game:HttpGet("https://moon-hub-eight.vercel.app/loader.lua"))()');
      btn.innerHTML = `<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#a855f7" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>`;
      setTimeout(() => {
        btn.innerHTML = `<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="9" y="9" width="13" height="13" rx="2"/><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/></svg>`;
      }, 2000);
    }

    const container = document.getElementById('particles');
    for (let i = 0; i < 18; i++) {
      const p = document.createElement('div');
      p.className = 'particle';
      const size = Math.random() * 6 + 2;
      p.style.cssText = `
        width: ${size}px; height: ${size}px;
        left: ${Math.random() * 100}%;
        animation-duration: ${Math.random() * 18 + 12}s;
        animation-delay: ${Math.random() * -20}s;
        opacity: ${Math.random() * 0.5 + 0.2};
      `;
      container.appendChild(p);
    }
  </script>
</body>
</html>
