# Summaries Directory

This directory contains all course summaries, cheatsheets, and related documents. You can organize your content in any folder structure you like!

## Structure

The summaries directory supports a flexible structure:

```
summaries/
├── subject1/
│   ├── document.pdf           # Direct PDF files
│   └── cheatsheet/           # LaTeX or Typst project folder
│       └── main.tex          # Main LaTeX file
├── subject2/
│   └── summary/
│       └── main.typ          # Main Typst file
└── topic/
    └── notes.pdf
```

## How It Works

### LaTeX Projects

Any directory containing a `main.tex` file is treated as a LaTeX project:

1. Create a folder anywhere under `summaries/` (e.g., `summaries/cheatsheets/analysis/`)
2. Add your LaTeX files, with the main file named `main.tex`
3. During build, the project is compiled with `pdflatex`
4. The output PDF is named based on the folder path (e.g., `cheatsheets-analysis.pdf`)

**Example:**
```
summaries/cheatsheets/analysis/
├── main.tex        # Will be compiled
├── figures/
│   └── graph.pdf
└── sections/
    └── limits.tex
```
Output: `homepage/src/uploads/cheatsheets-analysis.pdf`

### Typst Projects

Any directory containing a `main.typ` file is treated as a Typst project:

1. Create a folder anywhere under `summaries/` (e.g., `summaries/lectures/linear-algebra/`)
2. Add your Typst files, with the main file named `main.typ`
3. During build, the project is compiled with `typst`
4. The output PDF is named based on the folder path (e.g., `lectures-linear-algebra.pdf`)

**Example:**
```
summaries/lectures/linear-algebra/
└── main.typ        # Will be compiled
```
Output: `homepage/src/uploads/lectures-linear-algebra.pdf`

### Direct PDF Files

Place PDF files anywhere in the `summaries/` directory:

1. Add your PDF file to any folder (e.g., `summaries/exams/midterm.pdf`)
2. During build, it's copied to the uploads directory
3. If in a subdirectory, the folder path is prepended to the filename

**Example:**
```
summaries/exams/midterm.pdf
```
Output: `homepage/src/uploads/exams-midterm.pdf`

OR if at the root:
```
summaries/summary.pdf
```
Output: `homepage/src/uploads/summary.pdf`

## Naming Convention

- **LaTeX/Typst Projects**: The main file MUST be named `main.tex` or `main.typ`
- **Output Files**: Generated PDFs are named after their folder path with `/` replaced by `-`
  - `cheatsheets/analysis/` → `cheatsheets-analysis.pdf`
  - `lectures/cs/algorithms/` → `lectures-cs-algorithms.pdf`

## Build Process

During the GitHub Actions build:

1. **Find Projects**: Script recursively searches for `main.tex` and `main.typ` files
2. **Compile**: Each project is compiled in its directory (can reference local files)
3. **Copy PDFs**: All PDFs are copied to `homepage/src/uploads/`
4. **Commit**: Compiled PDFs are committed back to the repository
5. **Deploy**: Website with all PDFs is deployed

## Referencing Documents

In the website, reference PDFs using:

```html
<a href="../uploads/cheatsheets-analysis.pdf">Analysis Cheatsheet</a>
```

The filename corresponds to the folder path in `summaries/`.

## Tips

- Use descriptive folder names (they become part of the PDF filename)
- Keep related files together in project folders
- You can have multiple projects at different nesting levels
- Mix PDFs, LaTeX projects, and Typst projects freely
