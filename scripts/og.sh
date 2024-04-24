#!/bin/bash

# Directory containing markdown files
VAULT_DIR="$HOME/Documents/Notes/Personal"
SOURCE_DIR="zettelkasten"
DEST_DIR="Commonplace"


# Iterate through all markdown files in the source directory
find "$VAULT_DIR/$SOURCE_DIR" -type f -name "*.md" | while read -r file; do
  echo "Processing $file"

  # Extract the tag from the file. This assumes the tag is on the line immediately following "tags:"
  tag=$(awk '/category:/{getline; print; exit}' "$file" | sed -e 's/^ *- *//' -e 's/^ *//;s/ *$//' | sed 's/"\[\[\([^]]*\)\]\]"/\1/')

  echo "Found tag $tag"

  # If a tag is found, proceed with moving the file
  if [ ! -z "$tag" ]; then
    # Create the target directory if it doesn't exist
    TARGET_DIR="$VAULT_DIR/$DEST_DIR/$tag"
    mkdir -p "$TARGET_DIR"

    # Move the file to the target directory
    mv "$file" "$TARGET_DIR/"
    echo "Moved $file to $TARGET_DIR"
  else
    echo "No tag found for $file"
    TARGET_DIR="$VAULT_DIR/$DEST_DIR"
    mv "$file" "$TARGET_DIR/"
    echo "Moved $file to $TARGET_DIR"
  fi

done

echo "Done 🪷"
