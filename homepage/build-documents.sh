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
copy_pdfs() {
    echo "Searching for PDF files..."
    
    # Find all PDF files in summaries directory
    while IFS= read -r -d '' pdf_file; do
        local pdf_filename=$(basename "$pdf_file")
        
        # Get relative path from summaries/ for context
        local rel_path=${pdf_file#$SUMMARIES_DIR/}
        local dir_path=$(dirname "$rel_path")
        
        # Create a descriptive name if PDF is in a subdirectory
        if [ "$dir_path" != "." ]; then
            local output_name=$(echo "$dir_path" | tr '/' '-')-"$pdf_filename"
        else
            local output_name="$pdf_filename"
        fi
        
        cp "$pdf_file" "src/uploads/$output_name"
        echo "  ✓ Copied $rel_path to src/uploads/$output_name"
        
    done < <(find "$SUMMARIES_DIR" -type f -name "*.pdf" -print0)
}

# Run all build steps
copy_pdfs
compile_latex_projects
compile_typst_projects

echo ""
echo "Document build complete!"
echo "Files in src/uploads/:"
ls -lh src/uploads/ 2>/dev/null || echo "  (empty)"
