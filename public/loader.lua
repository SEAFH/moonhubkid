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
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>moon™</title>
  <link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@800;900&family=DM+Mono:wght@400;500&family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    :root {
      --purple: #a855f7; --purple-light: #c084fc; --purple-dim: #7c3aed;
      --purple-glow: rgba(168, 85, 247, 0.35); --bg: #0a0a0f; --surface: #111118;
      --border: rgba(168, 85, 247, 0.18); --text: #e2e8f0; --muted: #94a3b8;
    }
    html, body { min-height: 100%; background: var(--bg); color: var(--text); font-family: 'DM Sans', sans-serif; overflow-x: hidden; }
    body::before {
      content: ''; position: fixed; inset: 0;
      background: radial-gradient(ellipse 70% 55% at 50% 10%, rgba(120, 40, 220, 0.28) 0%, transparent 70%),
                  radial-gradient(ellipse 40% 35% at 20% 80%, rgba(90, 20, 180, 0.15) 0%, transparent 60%);
      z-index: 0; pointer-events: none;
    }
    nav { position: relative; z-index: 10; display: flex; align-items: center; justify-content: space-between; padding: 18px 40px; border-bottom: 1px solid var(--border); background: rgba(10, 10, 15, 0.6); backdrop-filter: blur(12px); }
    .nav-logo { display: flex; align-items: center; gap: 10px; font-family: 'Urbanist', sans-serif; font-size: 1.1rem; font-weight: 800; color: var(--text); text-decoration: none; }
    .moon-icon { width: 28px; height: 28px; background: linear-gradient(135deg, var(--purple), var(--purple-dim)); border-radius: 50%; box-shadow: 0 0 14px var(--purple-glow); position: relative; }
    .moon-icon::after { content: ''; position: absolute; top: 3px; right: 3px; width: 18px; height: 18px; background: var(--bg); border-radius: 50%; }

    main { position: relative; z-index: 1; display: flex; flex-direction: column; align-items: center; padding: 90px 20px 60px; text-align: center; }
    .wordmark {
      font-family: 'Urbanist', sans-serif; font-size: clamp(4.5rem, 11vw, 8rem); font-weight: 900; line-height: 0.95;
      background: linear-gradient(160deg, #d8b4fe 0%, var(--purple) 45%, var(--purple-dim) 100%);
      -webkit-background-clip: text; -webkit-text-fill-color: transparent; filter: drop-shadow(0 0 40px rgba(168, 85, 247, 0.5));
    }
    .tagline { margin-top: 22px; font-size: clamp(0.95rem, 2.2vw, 1.2rem); color: var(--muted); }

    .code-box {
      margin-top: 36px; display: flex; align-items: center; gap: 14px; background: rgba(20, 16, 35, 0.7);
      border: 1px solid var(--border); border-radius: 10px; padding: 14px 22px; backdrop-filter: blur(10px);
      max-width: 560px; width: 100%;
    }
    .code-text { font-family: 'DM Mono', monospace; font-size: 0.82rem; color: #c4b5fd; flex: 1; text-align: left; word-break: break-all; }

    .btn-primary {
      margin-top: 28px; display: inline-block; text-decoration: none;
      background: linear-gradient(135deg, var(--purple) 0%, var(--purple-dim) 100%);
      color: #fff; padding: 13px 30px; border-radius: 8px; font-weight: 700;
      box-shadow: 0 0 24px rgba(168, 85, 247, 0.5); transition: 0.15s; cursor: pointer;
    }
    .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 0 36px rgba(168, 85, 247, 0.7); }

    .access-denied-footer {
        margin-top: 50px; color: #f85149; font-weight: bold; font-size: 0.8rem;
        letter-spacing: 2px; text-transform: uppercase; opacity: 0.8;
    }
  </style>
</head>
<body>
  <nav>
    <a href="#" class="nav-logo">
      <div class="moon-icon"></div>
      <span>moon™</span>
    </a>
    <a href="#" class="nav-purchase">Purchase Status: <span style="color: var(--purple-light)">Active</span></a>
  </nav>

  <main>
    <h1 class="wordmark">moon<sup>™</sup></h1>
    <p class="tagline">Cloud-based <span style="color: var(--purple-light)">Protection</span> for your scripts.</p>

    <div class="code-box">
      <div class="code-text" id="loaderText">
        loadstring(game:HttpGet("https://<?php echo $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']; ?>"))()
      </div>
    </div>

    <div class="btn-row">
      <a class="btn-primary" onclick="copyToClipboard()">Copy Loader</a>
    </div>

    <div class="access-denied-footer">
        Raw Access Restricted - Internal Use Only
    </div>
  </main>

  <script>
    function copyToClipboard() {
      const text = document.getElementById('loaderText').innerText;
      navigator.clipboard.writeText(text).then(() => {
        alert("Đã copy loader vào bộ nhớ tạm!");
      });
    }
  </script>
</body>
</html>
