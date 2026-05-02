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

<script>
(function () {
  var DESIGN_W = 396;
  var DESIGN_H = 860;

  var deck   = document.getElementById('deck');
  var slides = Array.prototype.slice.call(deck.querySelectorAll('.slide'));
  var total  = slides.length;

  // Cover-fit: scale the 396×860 stage so it fills the viewport on
  // both axes (overflow is clipped by .slide). Recomputed on resize
  // and orientationchange so the URL bar collapse on mobile reflows.
  function fit() {
    var vw = window.innerWidth;
    var vh = window.innerHeight;
    var scale = Math.max(vw / DESIGN_W, vh / DESIGN_H);
    var offsetX = (vw - DESIGN_W * scale) / 2;
    var offsetY = (vh - DESIGN_H * scale) / 2;
    document.querySelectorAll('.stage').forEach(function (st) {
      st.style.transform = 'translate(' + offsetX + 'px,' + offsetY + 'px) scale(' + scale + ')';
    });
  }
  fit();
  window.addEventListener('resize', fit);
  window.addEventListener('orientationchange', fit);

  // Keyboard arrows for desktop testing.
  var current = 0;
  deck.addEventListener('scroll', function () {
    current = Math.max(0, Math.min(total - 1, Math.round(deck.scrollLeft / window.innerWidth)));
  }, { passive: true });
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
