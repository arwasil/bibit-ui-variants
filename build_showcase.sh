#!/bin/bash
set -e
SRC="/Users/wasil/Bibit UI/index.html"
DST="/Users/wasil/Bibit UI/showcase.html"

# Variant labels
declare -a LETTERS=(A B C D E F G)
declare -a TITLES=("Original · Clean" "Ambient · Fern Fronds" "Dark Skeuomorphism" "Ambient · Night Hill" "Data Terminal" "Expressive · Bento" "Skeumorphic Notepad")

# iphone__screen line ranges (start to end inclusive)
declare -a STARTS=(2648 2802 3019 3218 3435 3638 3848)
declare -a ENDS=(2786 3003 3202 3419 3621 3832 3964)

# Header & CSS-from-source
{
cat <<'HEAD'
<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<title>Bibit · Variant Showcase</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Space+Mono:wght@400;700&family=Albert+Sans:wght@400;500;600;700&family=Barlow:wght@400;500;600;700;800&family=Space+Grotesk:wght@400;500;600;700&family=DM+Sans:wght@400;500;600;700&family=Caveat:wght@400;500;600;700&family=Lora:wght@400;500;600;700&family=Courier+Prime:wght@400;700&display=swap" rel="stylesheet" />
<style>
HEAD

# Pull the CSS from source (skip the opening <style> on line 10 and the closing </style> on line 2625)
sed -n '11,2624p' "$SRC"

cat <<'SHOWCASE_CSS'

/* ════════════════════════════════════════
   SHOWCASE — full-bleed swipe deck
   Each slide is a 396×860 mockup screen scaled
   to fill the viewport. Horizontal swipe with
   CSS scroll-snap for native, smooth gestures.
   ════════════════════════════════════════ */
html, body {
  height: 100%;
  overflow: hidden;
  background: #000;
  overscroll-behavior: none;
}
body {
  padding: 0;
  font-family: "Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
}
.deck {
  display: flex;
  flex-direction: row;
  width: 100vw;
  height: 100vh;
  height: 100dvh;
  overflow-x: auto;
  overflow-y: hidden;
  scroll-snap-type: x mandatory;
  -webkit-overflow-scrolling: touch;
  scrollbar-width: none;
}
.deck::-webkit-scrollbar { display: none; }

.slide {
  flex: 0 0 100vw;
  width: 100vw;
  height: 100vh;
  height: 100dvh;
  scroll-snap-align: start;
  scroll-snap-stop: always;
  position: relative;
  overflow: hidden;
  background: #000;
}

/* Stage holds the unscaled 396×860 mockup; JS scales + centers it */
.stage {
  position: absolute;
  top: 0;
  left: 0;
  width: 396px;
  height: 860px;
  transform-origin: top left;
}

/* The 396×860 mockup screen itself — same look as .iphone__screen
   but without the iPhone body frame (the real phone IS the frame). */
.screen {
  position: relative;
  width: 396px;
  height: 860px;
  overflow: hidden;
}

/* HUD: chip in top corner showing current variant — sits above the
   mockup status bar so the badge is always findable during demo. */
.hud {
  position: fixed;
  top: max(env(safe-area-inset-top, 0px), 14px);
  left: 14px;
  z-index: 100;
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 6px 10px 6px 6px;
  background: rgba(20, 20, 22, 0.72);
  backdrop-filter: blur(14px) saturate(140%);
  -webkit-backdrop-filter: blur(14px) saturate(140%);
  border: 1px solid rgba(255,255,255,0.08);
  border-radius: 999px;
  color: #f4f4f4;
  font-family: "Inter", sans-serif;
  font-size: 12px;
  line-height: 16px;
  letter-spacing: -0.005em;
  pointer-events: none;
  opacity: 0.92;
  transition: opacity 240ms ease;
}
.hud--hidden { opacity: 0; }
.hud__badge {
  display: flex; align-items: center; justify-content: center;
  width: 22px; height: 22px; border-radius: 6px;
  background: #2a2a2e;
  font-family: ui-monospace, SFMono-Regular, Menlo, monospace;
  font-size: 11px;
  font-weight: 600;
  color: #fff;
}
.hud__title { font-weight: 600; }
.hud__counter { color: #8e8e93; font-variant-numeric: tabular-nums; }

/* Dot indicator at bottom — one dot per variant, active one filled. */
.dots {
  position: fixed;
  bottom: max(env(safe-area-inset-bottom, 0px), 14px);
  left: 50%;
  transform: translateX(-50%);
  z-index: 100;
  display: flex;
  align-items: center;
  gap: 7px;
  padding: 8px 12px;
  background: rgba(20, 20, 22, 0.72);
  backdrop-filter: blur(14px) saturate(140%);
  -webkit-backdrop-filter: blur(14px) saturate(140%);
  border: 1px solid rgba(255,255,255,0.08);
  border-radius: 999px;
  pointer-events: none;
  opacity: 0.92;
  transition: opacity 240ms ease;
}
.dots--hidden { opacity: 0; }
.dot {
  width: 6px; height: 6px; border-radius: 50%;
  background: rgba(255,255,255,0.28);
  transition: background 200ms ease, width 200ms ease;
}
.dot--active {
  background: #f4f4f4;
  width: 18px;
  border-radius: 3px;
}

/* The original .iphone__screen has rounded corners (46px) — we don't
   want that on the showcase since the real phone has its own corners.
   Reset for elements inside .screen. */
.screen .di,
.screen .home-indicator {
  display: none;
}
SHOWCASE_CSS

cat <<'BODY_OPEN'
</style>
</head>
<body>
  <div class="hud" id="hud" aria-live="polite">
    <span class="hud__badge" id="hudBadge">A</span>
    <span class="hud__title" id="hudTitle">Original · Clean</span>
    <span class="hud__counter" id="hudCounter">1 / 7</span>
  </div>

  <main class="deck" id="deck">
BODY_OPEN

# Emit each slide
for i in 0 1 2 3 4 5 6; do
  letter="${LETTERS[$i]}"
  title="${TITLES[$i]}"
  start="${STARTS[$i]}"
  end="${ENDS[$i]}"
  echo "    <!-- ══════ Variant $letter — $title ══════ -->"
  echo "    <section class=\"slide\" data-letter=\"$letter\" data-title=\"$title\">"
  echo "      <div class=\"stage\">"
  # Replace the source's `<div class="iphone__screen"` opening with `<div class="screen"`
  # and rewrite the matching closing div line. Easiest: pull the inner content
  # (between start+1 and end-1) and wrap it in our own .screen div.
  inner_start=$((start + 1))
  inner_end=$((end - 1))
  # Need to also preserve any inline style="background:..." that was on iphone__screen.
  # Pull the original opening line and grep for style attribute.
  open_line=$(sed -n "${start}p" "$SRC")
  bg_attr=""
  if [[ "$open_line" =~ style=\"([^\"]+)\" ]]; then
    bg_attr=" style=\"${BASH_REMATCH[1]}\""
  fi
  echo "        <div class=\"screen\"${bg_attr}>"
  sed -n "${inner_start},${inner_end}p" "$SRC"
  echo "        </div>"
  echo "      </div>"
  echo "    </section>"
done

cat <<'BODY_CLOSE'
  </main>

  <div class="dots" id="dots">
    <span class="dot dot--active" data-i="0"></span>
    <span class="dot" data-i="1"></span>
    <span class="dot" data-i="2"></span>
    <span class="dot" data-i="3"></span>
    <span class="dot" data-i="4"></span>
    <span class="dot" data-i="5"></span>
    <span class="dot" data-i="6"></span>
  </div>

<script>
(function () {
  var DESIGN_W = 396;
  var DESIGN_H = 860;

  var deck     = document.getElementById('deck');
  var hud      = document.getElementById('hud');
  var hudBadge = document.getElementById('hudBadge');
  var hudTitle = document.getElementById('hudTitle');
  var hudCount = document.getElementById('hudCounter');
  var dotsBox  = document.getElementById('dots');
  var slides   = Array.prototype.slice.call(deck.querySelectorAll('.slide'));
  var dots     = Array.prototype.slice.call(dotsBox.querySelectorAll('.dot'));
  var total    = slides.length;

  // Scale every stage to fill the viewport. We scale to whichever axis
  // is more constrained so the mockup fully covers the screen
  // (cover-fit), with overflow hidden by the slide.
  function fit() {
    var vw = window.innerWidth;
    var vh = window.innerHeight;
    var scaleW = vw / DESIGN_W;
    var scaleH = vh / DESIGN_H;
    // Cover: fill both axes — pick the LARGER scale.
    var scale = Math.max(scaleW, scaleH);
    // Center the scaled stage horizontally within the slide.
    var scaledW = DESIGN_W * scale;
    var scaledH = DESIGN_H * scale;
    var offsetX = (vw - scaledW) / 2;
    var offsetY = (vh - scaledH) / 2;
    document.querySelectorAll('.stage').forEach(function (st) {
      st.style.transform = 'translate(' + offsetX + 'px,' + offsetY + 'px) scale(' + scale + ')';
    });
  }
  fit();
  window.addEventListener('resize', fit);
  window.addEventListener('orientationchange', fit);

  // Track active slide via scroll position; update HUD + dots.
  var current = 0;
  function update() {
    var w = window.innerWidth;
    var i = Math.round(deck.scrollLeft / w);
    if (i < 0) i = 0;
    if (i > total - 1) i = total - 1;
    if (i === current) return;
    current = i;
    var s = slides[i];
    hudBadge.textContent = s.dataset.letter;
    hudTitle.textContent = s.dataset.title;
    hudCount.textContent = (i + 1) + ' / ' + total;
    dots.forEach(function (d, di) {
      d.classList.toggle('dot--active', di === i);
    });
  }
  deck.addEventListener('scroll', update, { passive: true });

  // Auto-fade HUD/dots a few seconds after the user stops swiping
  // so the chrome doesn't distract from the mockup.
  var hideTimer;
  function showChrome() {
    hud.classList.remove('hud--hidden');
    dotsBox.classList.remove('dots--hidden');
    clearTimeout(hideTimer);
    hideTimer = setTimeout(function () {
      hud.classList.add('hud--hidden');
      dotsBox.classList.add('dots--hidden');
    }, 2200);
  }
  deck.addEventListener('scroll', showChrome, { passive: true });
  document.addEventListener('touchstart', showChrome, { passive: true });
  document.addEventListener('click', showChrome);
  showChrome();

  // Keyboard arrows for desktop testing.
  window.addEventListener('keydown', function (e) {
    if (e.key === 'ArrowRight' && current < total - 1) {
      deck.scrollTo({ left: (current + 1) * window.innerWidth, behavior: 'smooth' });
    } else if (e.key === 'ArrowLeft' && current > 0) {
      deck.scrollTo({ left: (current - 1) * window.innerWidth, behavior: 'smooth' });
    }
  });
})();
</script>
</body>
</html>
BODY_CLOSE
} > "$DST"

echo "Wrote: $DST"
wc -l "$DST"
