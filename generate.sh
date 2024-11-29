#!/bin/bash

# Output file name
OUTPUT_FILE="adventures.pdf"

# Paths
MD_FILE="jhed-wasteland/adventures.md"
TEX_INCLUDE="code/jhed.tex"
LUA_FILTER="code/columns.lua"
RESOURCE_PATH="jhed-wasteland"

# Check if Pandoc is installed
if ! command -v pandoc &> /dev/null
then
    echo "Pandoc could not be found, please install it first."
    exit
fi

# Run Pandoc with the necessary options
echo "Generating PDF from $MD_FILE including LaTeX settings from $TEX_INCLUDE and Lua filter $LUA_FILTER..."

pandoc $MD_FILE \
  -o $OUTPUT_FILE \
  --resource-path=$RESOURCE_PATH \
  --pdf-engine=xelatex \
  --include-in-header=$TEX_INCLUDE \
  --lua-filter=$LUA_FILTER

# Check if the output file was generated
if [ -f "$OUTPUT_FILE" ]; then
    echo "PDF generated successfully: $OUTPUT_FILE"
else
    echo "PDF generation failed."
fi
