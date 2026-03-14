# Summaries

[![Build and Deploy to GitHub Pages](https://github.com/dcamenisch/summaries/actions/workflows/node.js.yml/badge.svg)](https://github.com/dcamenisch/summaries/actions/workflows/node.js.yml)

My study summaries and cheat sheets from ETH Zurich, plus the website that displays them. Part of the [Polyring](https://polyring.ch) webring.

The site is available at: https://dcamenisch.github.io/summaries/

## Repository Structure

```
summaries/          # Source documents (LaTeX, Typst, or pre-compiled PDFs)
homepage/           # 11ty website source
  src/
    _data/          # Global data (documents.json — document index)
    _includes/      # Nunjucks templates
    uploads/        # Pre-compiled PDFs committed to the repo
  build-documents.sh  # Compiles summaries/ sources → src/uploads/
```

## Adding a Document

### Option A: Pre-compiled PDF

1. Drop the PDF into `homepage/src/uploads/`
2. Add an entry to `homepage/src/_data/documents.json`
3. Push — it appears on the site

### Option B: LaTeX or Typst source

1. Create a folder in `summaries/` with a `main.tex` or `main.typ` file
2. Add an entry to `homepage/src/_data/documents.json` referencing the output filename
3. Push — CI compiles it and deploys automatically

Output PDFs are named after their folder path with `/` replaced by `-`
(e.g. `summaries/analysis/cheatsheet/` → `analysis-cheatsheet.pdf`)

## documents.json format

```json
[
  {
    "course": "Course Name",
    "semester": 3,
    "type": "summary",
    "file": "CourseName.pdf"
  },
  {
    "course": "Another Course",
    "semester": 4,
    "type": "both",
    "summaryFile": "Course-Summary.pdf",
    "cheatsheetFile": "Course-Cheatsheet.pdf"
  }
]
```

Fields:
- `semester` — integer 1–6, or `0` for GESS/Ergänzung
- `type` — `"summary"`, `"cheatsheet"`, or `"both"`
- `file` — filename in `src/uploads/` (used when `type` is not `"both"`)
- `summaryFile` / `cheatsheetFile` — used when `type` is `"both"`
- `extraLink` (optional) — `{ "url": "...", "label": "..." }` for an additional link

## GitHub Pages Setup

1. Go to Settings → Pages → Source → select **GitHub Actions**
2. Push to `main` — the workflow builds and deploys automatically
