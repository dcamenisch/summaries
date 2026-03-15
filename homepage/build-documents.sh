#!/bin/bash

# Build script for compiling LaTeX and Typst documents to PDFs
# This script is run during the GitHub Actions build process
# 
# Structure: The summaries/ directory can contain any folder structure.
# - Directories with .tex files are treated as LaTeX projects
# - Directories with .typ files are treated as Typst projects
# - PDF files anywhere in summaries/ are copied directly

set -e  # Exit on any error

echo "Starting document build process..."

# Create the uploads directory if it doesn't exist
mkdir -p src/uploads

SUMMARIES_DIR="../summaries"
SCRIPT_DIR=$(pwd)

# Function to compile LaTeX projects
compile_latex_projects() {
    echo "Searching for LaTeX projects..."
    
    # Find all directories containing .tex files
    while IFS= read -r -d '' tex_file; do
        local project_dir=$(dirname "$tex_file")
        local tex_filename=$(basename "$tex_file")
        
        # Skip if not main.tex (convention for main file)
        if [ "$tex_filename" != "main.tex" ]; then
            continue
        fi
        
        echo "  Compiling LaTeX project: $project_dir"
        
        # Get relative path from summaries/ for output filename
        local rel_path=${project_dir#$SUMMARIES_DIR/}
        local output_name=$(echo "$rel_path" | tr '/' '-')
        
        # Compile in the project directory
        cd "$project_dir"
        pdflatex -interaction=nonstopmode "main.tex" > /dev/null 2>&1 || {
            echo "    Warning: First pass of pdflatex failed for $project_dir/main.tex"
        }
        pdflatex -interaction=nonstopmode "main.tex" > /dev/null 2>&1 || {
            echo "    Warning: Second pass of pdflatex failed for $project_dir/main.tex"
        }
        cd "$SCRIPT_DIR"
        
        # Move the PDF to uploads directory with descriptive name
        if [ -f "$project_dir/main.pdf" ]; then
            mv "$project_dir/main.pdf" "src/uploads/${output_name}.pdf"
            echo "    ✓ Created src/uploads/${output_name}.pdf"
        else
            echo "    ✗ Failed to create PDF from $project_dir/main.tex"
        fi
        
        # Clean up auxiliary files
        rm -f "$project_dir"/main.{aux,log,out,toc,lof,lot,fls,fdb_latexmk,synctex.gz}
        
    done < <(find "$SUMMARIES_DIR" -type f -name "*.tex" -print0)
}

# Function to compile Typst projects
compile_typst_projects() {
    echo "Searching for Typst projects..."
    
    # Find all directories containing .typ files
    while IFS= read -r -d '' typ_file; do
        local project_dir=$(dirname "$typ_file")
        local typ_filename=$(basename "$typ_file")
        
        # Skip if not main.typ (convention for main file)
        if [ "$typ_filename" != "main.typ" ]; then
            continue
        fi
        
        echo "  Compiling Typst project: $project_dir"
        
        # Get relative path from summaries/ for output filename
        local rel_path=${project_dir#$SUMMARIES_DIR/}
        local output_name=$(echo "$rel_path" | tr '/' '-')
        
        # Compile Typst file to PDF
        typst compile "$typ_file" "src/uploads/${output_name}.pdf" || {
            echo "    ✗ Failed to compile $project_dir/main.typ"
            continue
        }
        
        echo "    ✓ Created src/uploads/${output_name}.pdf"
        
    done < <(find "$SUMMARIES_DIR" -type f -name "*.typ" -print0)
}

# Function to copy pre-compiled PDFs
# Reads documents.json and copies each PDF source to its declared output filename.
# Supports two source fields:
#   "source"    — path shown as [source] link on the website (may be .goodnotes or .pdf)
#   "pdfSource" — path of the actual PDF to copy (used when source is not a .pdf)
# If only "source" is set and it ends in .pdf, that file is copied.
# Entries with no source/.pdfSource are expected to be pre-placed in src/uploads/.
copy_pdfs() {
    echo "Copying PDFs listed in documents.json..."

    # Parse documents.json with python3 (always available in CI)
    python3 - <<'PYEOF'
import json, os, shutil, sys

docs_path = "src/_data/documents.json"
repo_root = ".."
uploads_dir = "src/uploads"

with open(docs_path) as f:
    docs = json.load(f)

def copy_entry(file_out, pdf_src_rel):
    if not pdf_src_rel:
        return
    src = os.path.join(repo_root, pdf_src_rel)
    dst = os.path.join(uploads_dir, file_out)
    if not os.path.exists(src):
        print(f"  ✗ Source not found: {src}")
        return
    shutil.copy2(src, dst)
    print(f"  ✓ Copied {pdf_src_rel} → {file_out}")

for doc in docs:
    if doc.get("type") == "both":
        for file_key, src_key in [("summaryFile", "summarySource"), ("cheatsheetFile", "cheatsheetSource")]:
            out = doc.get(file_key)
            src = doc.get(src_key)
            if out and src:
                pdf_src = doc.get("pdfSummarySource" if "summary" in file_key.lower() else "pdfCheatsheetSource", src)
                # Use pdfSource override if source is not a pdf
                if not src.endswith(".pdf"):
                    pdf_src = doc.get("pdfSummarySource" if "summary" in file_key.lower() else "pdfCheatsheetSource")
                    if not pdf_src:
                        print(f"  ⚠ No PDF source for {out} (source is {src}), skipping copy")
                        continue
                copy_entry(out, pdf_src)
    else:
        out = doc.get("file")
        src = doc.get("source")
        if out and src:
            if src.endswith(".pdf"):
                copy_entry(out, src)
            else:
                pdf_src = doc.get("pdfSource")
                if pdf_src:
                    copy_entry(out, pdf_src)
                else:
                    print(f"  ⚠ No pdfSource for {out} (source is {src}), skipping copy")
PYEOF
}

# Run all build steps
copy_pdfs
compile_latex_projects
compile_typst_projects

echo ""
echo "Document build complete!"
echo "Files in src/uploads/:"
ls -lh src/uploads/ 2>/dev/null || echo "  (empty)"
