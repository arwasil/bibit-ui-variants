# Bibit UI — Design Spec

Source: Paper file "Jolly dragon" (Page 1). Three artboards: **Homepage**, **Portofolio**, **Saham (Bibit Saham detail)**. All three are 768 px wide (tablet / large-mobile frame).

---

## 1. Foundations

### Brand / Mood
Indonesian retail investing app. The visual register is **bookish / financial-clean**: white surfaces, crisp hairline dividers, one saturated brand green as the only hero color, neutral grays for everything else, plus a narrow categorical palette (blue / purple / brown) used only inside data viz.

### Palette

| Role | Hex | Usage |
|---|---|---|
| Brand green (primary) | `#00AB6B` | logo, CTAs, positive gains, active nav icon, "Explore/Deposit/Tambah/Ubah" links |
| Brand green (deep) | `#008F59` | gain value inside stock rows (slightly darker for contrast on white) |
| Green tint | `#EBF8F3` | Deposit pill bg, "Reksa Dana" icon disc |
| Green tint (soft) | `#E1F4ED` | Portfolio screen page background + nilai-portofolio hero card |
| Green tint (chart) | `#CCEEE1` | Pasar Uang segment disc |
| Page bg (default) | `#F7F7F7` | Homepage body between cards |
| Surface white | `#FFFFFF` | all cards, Saham screen bg |
| Translucent white | `#FFFFFF59` / `#FFFFFF80` / `#FFFFFFB3` | frosted cards on the mint-tinted Portfolio hero |
| Text primary | `#333333` | titles, amounts, body |
| Text muted | `#858585` | labels ("Nilai Portofolio", "Keuntungan", ticker descriptions) |
| Icon muted | `#969696` / `#A6A6A6` | inactive bottom-nav icons, meta icons |
| Hairline | `#EDEDED` / `#F1F1F1` | card borders and row dividers (0.625 px) |
| Loss red | `#E5443F` (approx, from screenshots) | negative values, "▼" indicator |
| Data-viz blue (Obligasi) | text `#2479B4` on disc `#D3E4F0` |
| Data-viz blue (Campuran) | text `#41A1D8` on disc `#D5EBF6` |
| Data-viz purple (Saham) | text `#9343C8` on disc `#E9D9F4` |
| Data-viz brown (Cash) | text `#A97C50` on disc `#E9DED3` |
| Data-viz coral (SBN Retail icon) | disc `#F7E1E0` |

### Typography
- **Family:** System Sans-Serif (the only family loaded in the doc — the live app uses a geometric humanist sans; any neutral sans at similar metrics will match).
- **Scale (px / line-height px):**
  - Hero amount (header, white on green): **25 / 32 bold** — `Rp3,362,586,001`
  - Hero amount (Portfolio card, on mint): **25 / 21.6 bold** — `Rp3,363,002,001`
  - Section title / row title: **16 / 21.6 bold** — "Invest 2026-2030"
  - Card title small / numeric body: **15 / 20.25 bold or regular** — "Produk Investasi", "Rp2,298,443,230"
  - Meta + labels: **14 / 18.9 regular** — "13 Produk", "Explore"
  - Caption / chip text / tab label: **13 / 16–17.55** — "Portofolio", "SIP", "Deposit"
- **Weight usage:** bold is reserved for amounts, titles, and CTAs. Everything else is regular — hierarchy comes from size + color, not weight spam.
- **Letter-spacing:** default (no tracking adjustments in the source).

### Spacing / layout
- Artboard width **768 px**; content gutter **20 px** (most cards use `px-5` / `px-4`).
- Cards: **rounded-md (≈ 5 px)**, **0.625 px** hairline border `#EDEDED`, white fill, no shadow.
- Section rhythm: **21 px tall `#F7F7F7` spacer rectangles** separate every section on the Homepage (they act as page-bg gaps between stacked white cards).
- List rows: **126 px** tall (portfolio list), **76 px** tall (stock list). Divider is a 0.996 px `#EDEDED` line inset 20 px from each edge.
- Icon + text rail uses a fixed 40 px circle (`size-10`) with 16 px gap to text — keeps column alignment across repeated rows.

### Iconography
- 20–24 px stroked line icons, 1.5 px stroke, rounded caps/joins.
- Circular icon discs 40 px for product rows, 56 px for allocation donuts, 32 px for Top Up/Jual/SIP action tiles.

### Numbers, tone, localization
- Currency prefix: `Rp` with comma thousands, no space (`Rp3,362,586,001`).
- Percent: `+2.90%` / `-3.76%` with `▲` / `▼` glyph in brand green / red.
- All copy is in **Indonesian** (Portofolio, Keuntungan, Imbal Hasil, Produk, Tambah Baru, Lihat Semua, Mulai Nabung, etc.). Placeholder text across screens refers to real Indonesian products: AADI (Adaro), BRIS (Bank Syariah Indonesia), TLKM (Telkom), SBN Retail, FR Syariah, Reksa Dana.

---

## 2. Homepage — [1G9-0](#) (768 × 4153)

Long scrolling home feed. Page bg `#F7F7F7`, sections are stacked white cards separated by 21 px gray spacers.

### 2.1 Dark-green hero header (279 px tall)
Full-bleed rectangle with a dark-green → light-green painted gradient image as bg; white-on-green typography sits on top.

- **Top bar** (left): `bibit PREMIUM` wordmark (green "bibit" + white/cream "PREMIUM").
- **Top bar** (right): bell / inbox icon with a **"55" red-dot badge**.
- **Hero amount row**
  - Above, muted `#858585`-on-green label: `Nilai Portofolio`.
  - Huge white bold number: `Rp3,362,586,001` (25 / 32 bold).
  - A small lock icon (`#A6A6A6`) indicating value is visible.
  - On the right, a `#EBF8F3` pill "`1 🔥`" — monthly streak counter.
- **Two-column stats** under the amount
  - Left: `Keuntungan` label + `Rp97,019,689` in brand green.
  - Right (right-aligned): `Imbal Hasil` label + `▲ +2.90%` in brand green.
- A **white "Deposit" pill** (`#EBF8F3` bg, `#00AB6B` bold 13 px text) sits in its own card just below the header, floating over the gradient → white transition.

### 2.2 Quick-nav strip (4 tiles)
White card, 4 equal columns: **Portofolio · SIP · Premium · Lainnya**.
- Each tile: 24 px icon, 4 px gap, 13 px `#333333` label, centered.
- "Premium" tile's icon is oversized (45×45, negative-offset top/left) to give the premium affordance visual weight.

### 2.3 Produk Investasi row
White card, title row + 4 icon-label items.
- Title: `Produk Investasi` (bold 15/20), right-side link `Explore` in `#00AB6B`.
- Four items (40 px circle + 14 px label): **Reksa Dana** (green disc `#EBF8F3`), **SBN Retail** (coral disc `#F7E1E0`), **FR Syariah** (green disc), **Saham** (purple disc).

### 2.4 Bisnis promo banner
Full-width white card, mint-green left icon, copy:
- Title: **Mulai Investasi untuk Bisnis Kamu** (bold)
- Body: "Daftarkan perusahaan ke Bibit Bisnis untuk investasi semudah di Bibit pribadi kamu."
- CTA link `Pelajari lebih lanjut` in brand green, `→` chevron on the right, small `×` dismiss in top-right.

### 2.5 Portofolio horizontal carousel
White card section.
- Header: `Portofolio` (left), `Tambah Baru` link (right, green).
- Horizontally scrollable row of portfolio cards, each card **~375 × 210** with:
  - 40 px colored circular icon (green / orange / purple depending on goal).
  - Title (bold 16): `Invest 2026-2030`, `Dana darurat`, …
  - Subtitle muted (14): `13 Produk`.
  - Two-column KPI row: `Nilai Portofolio` / `Keuntungan` (muted labels, bold 15 px amounts; positive in green, negative in red).
  - Full-width green button **"Top Up"** (`#00AB6B` bg, white, bold 15).

### 2.6 Top Reksa Dana
White card.
- Title bold 16 `Top Reksa Dana`, right link `Lihat Semua`.
- Subtitle regular 15 `Rutin Investasi di Top Reksa Dana`, helper copy 14 muted.
- Tab pills: **Pasar Uang (active, mint fill)** · **Obligasi** · **Saham**. Active pill uses `#EBF8F3` bg + green bold text.
- Ranked list rows `1 · 2 · 3` with fund logo, fund name, and right-side `1Y Return` as a bold green percentage (5.03% / 4.88% / 4.70%).

### 2.7 Robo — "Rekomendasi Robo Kamu"
White card.
- Title bold 16 `Robo`. Body line: `Rekomendasi Robo Kamu`, helper copy.
- Light-green inset strip promoting **Yuk Kenalan Sama Robo** (dismiss X on right).
- **Robo portfolio card**: "Dari alami ke stashaway" heading, `Profil Risiko: 2.5`, right-side `Ubah` link.
- Three allocation rows — each row: pie-like icon (colored), allocation name bold + fund name muted, right side `%` bold + chevron.
  - Pasar Uang 47% · Obligasi 43% · Saham 10%.
- Full-width primary button **"Investasi Sekarang"** (green, white bold text, rounded).

### 2.8 Systematic Investment Plan (SIP)
White card.
- Title bold 16 `Systematic Investment Plan (SIP)`, right link `Explore`.
- Subtitle regular 15 `Mulai Nabung Rutin Secara Otomatis`.
- Segmented tab: **Reksa Dana (active, green underline)** · Obligasi FR · Saham.
- Two-column form: **Portofolio Tujuan** (dropdown preselected "Invest 2026-2030") + **Produk Investasi** (placeholder "Pilih Produk Investasi").
- **Nilai Investasi Bulanan** input: placeholder `Contoh: Rp10,000,000`.
- Chip row of quick amounts: `100.000`, `500.000`, `1.000.000`, `5.000.000`, `10.000.000`, `25.000.000`, `50.000.000`, `100.000.000` (pill outlines; horizontally scrolls if needed).
- Full-width green button **"Mulai SIP"**.

### 2.9 Artikel
White card, title `Artikel` + `Lihat Semua` link. Three horizontal article rows: thumbnail (80 × 80 rounded) + headline (2-line bold 15) + category muted 13 (`Education` / `News`).
- "Kenapa Penting Punya Reksa Dana Pasar Uang di Portofolio?"
- "SR024 Berakhir, Nantikan SBN Selanjutnya: ST016 Mulai 8 Mei 2026"
- "Penawaran SR024 Berakhir Besok, Kesempatan Terakhir Kunci Fixed Rate Return"

Below the list, a mint **WhatsApp Channel** promo strip ("Ikuti WhatsApp Channel Bibit untuk dapatkan artikel terbaru setiap hari.") with chevron.

### 2.10 Event carousel
White card, title `Event` + `Lihat Semua` link, subtitle `Temukan Berbagai Event di Bibit`.
- Horizontal tile row, each ~180 × 220: event poster image, 2-line title, countdown line `01:01:41` etc.
- Example titles: "Trump Tariffs and Your …", "Kesalahan Investasi yang …", "Curhat Bapak Ibu - Investasi …", "Market Update : Investasi …", "Investasi SR019 untuk Tujuan …".

### 2.11 Academy
White card, title `Academy` + `Lihat Semua`, subtitle `Pusat Edukasi Investasi`.
- Horizontal tile row, each ~230 × 220: pastel-peach photo tile with a person portrait, overlaid title + name, and a pill **"8 Video"** / **"9 Video"** / **"7 Video"** bottom-left.
- Examples: "Surat Berharga Negara (SBN) – Ricky Susanto Joeng, CFP®", "Obligasi Fixed Rate (FR) – Gabrielle Christie", "Reksa… – Virtina T…".

### 2.12 Gift Card Reksa Dana
White card, left gift-box illustration, title bold 15 `Gift Card Reksa Dana`, body muted: "Hadiahkan reksa dana ke teman dan keluarga kamu di hari spesial mereka." Chevron right.

### 2.13 WhatsApp Channel Bibit (repeat CTA)
Same mint banner pattern as 2.9 trailing strip, title bold 15, helper muted.

### 2.14 Footer
Centered "PT Bibit Tumbuh Bersama / berizin dan diawasi oleh" line with the **OJK** logo to the right, then a horizontal row of social icons (Instagram, X, TikTok, LinkedIn, YouTube) in muted gray.

---

## 3. Portofolio — [49M-0](#) (768 × 1444)

Landing screen for the portfolio tab. Page bg `#E1F4ED` (mint) at top, `#FFFFFF` below — so the hero floats on a tinted ground while the list below reads as a regular list.

### 3.1 Top app bar (80 px)
White-ish translucent bar.
- Centered bold 16 title `Portofolio`.
- Right-aligned 3-dot overflow menu.

### 3.2 Hero card — "Nilai Portofolio" (313 px tall, mint-tinted frosted card)
- Card uses translucent white fills (`#FFFFFF59` + hairline `#FFFFFF66`) to sit on the mint ground; note the card is split into two bonded panels — upper (summary + donut) and lower (Monthly Streak strip at `#FFFFFF80`).
- Row 1: label `Nilai Portofolio` (15/ regular, `#333333`) on the left, a **Moderat** risk-profile pill on the right: shield icon + text inside a `#FFFFFFB3` pill with a left-hook rounded shape (radius-only on the left side, `rounded-tl-[50px] rounded-bl-[50px]`).
- Row 2: huge bold amount `Rp3,363,002,001` (25 / 21.6 bold) with a lock icon to the right.
- Row 3 (gain line): `↗ Rp97,435,689 (+2.91%)` in brand green, with an up-right arrow glyph.
- **Allocation donuts row** — 5 circles, each 56 px:
  - `25% Pasar Uang` — disc `#CCEEE1`, text `#00AB6B`
  - `46% Obligasi` — disc `#D3E4F0`, text `#2479B4`
  - `25% Saham` — disc `#E9D9F4`, text `#9343C8`
  - `0% Campuran` — disc `#D5EBF6`, text `#41A1D8`
  - `4% Cash` — disc `#E9DED3`, text `#A97C50`
- **Monthly Streak** bottom strip: left label `Monthly Streak` (14 regular), right side `1 🔥` (bold 15 + 16 px fire icon).

### 3.3 Portofolio list section
White surface, rounded-top hairline divider rectangle (8 px band) separates from hero.
- Header row: `Portofolio` bold 16, right side **+ Tambah** link in brand green (plus-circle icon 18 px + "Tambah" text 14).
- **Five portfolio rows** (each 126 px tall, white, 0.625 px `#EDEDED` border, rounded md, 16 px padding):
  - Icon disc 40 px (color-coded by goal type) on the left.
  - Title bold 16 + subtitle muted 14 (`X Produk`) stacked.
  - A **"Robo" green chip** appears on the rightmost title row for Robo-managed goals (e.g. "Dari alami ke stashaway").
  - Bottom half: two columns — `Nilai Portofolio` label + bold 15 amount (left) / `Keuntungan` label + bold 14 amount (right, green if ≥ 0, red if < 0).
  - Rows seen: **Invest 2026-2030** (13 Produk, Rp2,298,443,230 / +Rp77,643,459), **Dana darurat** (1 Produk, Rp188,397,829 / +Rp24,874,654), **Bibit Saham** (3 Produk, Rp102,620,625 / −Rp3,668,198), **Payroll fund** (1 Produk, Rp172,453,835 / +Rp2,453,835), **Dari alami ke stashaway — Robo** (4 Produk, Rp459,053,715 / −Rp3,868,060).

### 3.4 Bottom tab bar (60 px, 5 slots)
White, hairline top, 50 × 50 tap target per slot, 20–21 px stroked icon each. Slots left→right: **Home · Portfolio (active, brand green) · Search · Transactions · Profile**. Only the active icon is `#00AB6B`; the rest are `#858585` / `#969696`.

---

## 4. Saham (Bibit Saham detail) — [64G-0](#) (768 × 1561)

Portfolio detail screen for the **Bibit Saham** goal. White page bg.

### 4.1 Top app bar (80 px)
- Left: circular back-button (30 × 30) with a left-chevron in brand green `#00AB6B`.
- Center title: small brand mark (green circle with up-arrow logo, 18 px) + bold 16 `Bibit Saham`.
- (Symmetric empty 296 px on the right to keep the title optically centered.)

### 4.2 Summary block (203 px, flush to top bar, light mint ground)
- Label `Nilai Portofolio` (14 regular, `#858585`) aligned left.
- Amount `Rp102,292,700` (25 / 32 bold, `#333333`).
- Two-column row below:
  - Left: `Keuntungan` label + `-Rp3,996,123` in red (bold 15).
  - Right-aligned: `Imbal Hasil` label + `▼ -3.76%` in red.

### 4.3 Actions card (3 tiles, 87 px tall)
- White card, 0.625 px `#EDEDED` border, rounded sm, **two vertical `#F1F1F1` dividers** separating three equal columns.
- Each tile: 32 px mint-green stroked icon in a subtle rounded square, 4 px gap, 13 px `#333333` label.
- Labels: **Top Up · Jual · SIP**.

### 4.4 Holdings list (3 rows, 76 px each)
- Section header bar above list (50 px, empty title band reserved for potential "Holdings" label / sort controls).
- Each row: 40 px circular stock logo (left) + ticker + company name stacked + right-aligned current value + right-aligned P&L.
  - **AADI** — ADARO ANDALAN INDONESIA Tbk — `Rp32,700` · `Rp9,766 (+42.58%)` in deep green `#008F59`.
  - **BRIS** — Bank Syariah Indonesia Tbk. — `Rp51,912,000` · `-Rp2,661,737 (-4.88%)` in red.
  - **TLKM** — Telkom Indonesia (Persero) Tbk. — `Rp50,348,000` · `-Rp1,344,152 (-2.60%)` in red.
- 0.996 px `#EDEDED` hairline between rows, inset 20 px left/right.
- Ticker in bold 15 `#333333`; company name in regular 13 `#858585`.
- Large empty space below the list to the artboard bottom — the screen is intentionally airy so the three holdings read as the hero content.

---

## 5. Cross-screen component inventory

| Component | Spec |
|---|---|
| **Primary button** | full-width, 48 px tall, `#00AB6B` bg, white bold 15 text, radius 6–8 px. Examples: "Investasi Sekarang", "Mulai SIP", row-level "Top Up". |
| **Ghost / tertiary link** | `#00AB6B`, regular 14. Examples: "Explore", "Lihat Semua", "Tambah Baru", "Ubah", "Pelajari lebih lanjut". |
| **Chip / tab (active)** | `#EBF8F3` bg, `#00AB6B` bold 13 text, radius 20 px, 8×12 padding. Example: Deposit pill, active tab in "Top Reksa Dana". |
| **Chip / tab (inactive)** | transparent bg, `#333333` regular 13, radius 20 px — underline or no fill. |
| **Card** | white bg, 0.625 px `#EDEDED` border, radius 5 px, no shadow. |
| **Row divider** | 0.996 px `#EDEDED`, inset 20 px from edges. |
| **Icon disc** | 40 px circle, pastel fill matched to category (mint / coral / purple / etc.), 20–22 px stroked icon inside. |
| **Allocation disc** | 56 px circle, category-tinted bg, percent text in category-matched stronger color, bold 15. |
| **Bottom nav** | 60 px white bar, hairline top, 5 equal slots, 20 px stroked icons; active icon only in `#00AB6B`, inactive in `#858585`. |
| **App bar** | 80 px, centered bold 16 title, optional left chevron, right-side overflow. |
| **Value pair** | muted label 14 over bold 15 amount (positive green, negative red, neutral `#333`). Used everywhere financial data appears. |

---

## 6. Implementation notes

- **Responsive framing.** Artboards are 768 px-wide tablet mocks. For a phone build, clamp content to 375–414 px and keep the 20 px side gutter; the gray spacer rectangles translate to a `gap` or `margin-block` of 21 px between sections.
- **Scroll model.** Homepage is a single vertical scroll with three embedded horizontal carousels (Portofolio, Event, Academy) and an internally-scrolling SIP chip row.
- **State coverage needed** (not drawn, but implied by the data): empty portfolio goal, loss variant of each row (red semantics already defined), logged-out / balance-hidden (the lock icon already appears — treat it as a toggle to mask the balance).
- **Accessibility.** Loss red on white and gain green on white both clear 4.5:1 at 14 px bold. The white-on-dark-green hero amount is large enough (25 px bold) to be AA; keep muted `#858585` labels at ≥ 14 px only — do not shrink them for density.
- **Assets.** Icons are served from Paper as SVG URLs in the mock (e.g. `app.paper.design/file-assets/.../*.svg`). For production, re-export as an icon font or local SVG sprite; none of the icons contain brand detail that can't be re-drawn from the 1.5 px stroked line style.

---

## 7. Exploration iterations (in `index.html`)

Each variant renders the Portfolio screen inside a 396 × 860 iPhone 16 Pro mockup. Variants A/B are the canonical reference; C–E explore alternate visual directions.

- **A — Clean · Moderat.** Baseline rendering of §3 Portofolio. Light mode, mint-tinted hero ground, brand-green `#00AB6B` accent.
- **B — Clean · Agresif.** Variant A retextured with "Agresif" risk profile data (different numbers, higher volatility). Same design system.
- **C — Dark Skeuomorphism.** Dark ground, tactile gradient cards, soft inner-shadow insets. Used as a tactile "physical" exploration — kept as a reference, not the current direction.
- **D — Data Terminal.** Monochrome dark, vertical-bar histogram replacing the donut, Space Mono eyebrows/labels paired with Inter numerics, YTD chip bar pinned to the bottom. Accent: single indigo `#5B5BD6` in the dominant bar segment (Saham). Hero card bg `#161618`, screen bg `#0d0d0d`.
- **E — Ambient · Glassmorphism.** Full-bleed photographic ground (dusk sky + silhouette horizon, rendered via stacked radial gradients + inline SVG mountains + SVG turbulence noise). Hero data sits directly on the photo with `text-shadow: 0 1px 20px rgba(0,0,0,0.4)` for legibility. Secondary data lives in frosted cards — `rgba(10,10,10,0.4)` + `backdrop-filter: blur(28px) saturate(160%)` + `0.5px solid rgba(255,255,255,0.12)` + `border-radius: 20px`. Typography is all white, hierarchy by opacity (100% / 80% / 55% / 50%) and size only — no brand green, no status red/green. Single warm accent `#ffb47a` extracted from the sunset, used on the YTD gain only. Bottom nav is a frosted pill positioned absolute at `bottom: 22px`.
