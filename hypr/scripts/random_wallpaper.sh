#!/bin/bash

# This script safely finds and sets a random wallpaper, handling spaces in names.

# Check if swww-daemon is running, and start it if it's not.
if ! pgrep -x "swww-daemon" >/dev/null; then
  swww-daemon &
  sleep 1 # Wait for daemon to initialize
fi

# Directory where your wallpapers are stored
WALLPAPER_DIR="$HOME/.dotfiles/assets/Wallpapers"

# Check if the directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
  exit 1
fi

# --- This is the new, safer way to find and read file paths ---
# Create an empty array to store wallpaper paths
WALLPAPERS=()
# Use a while loop with `find` and `read` to safely handle all filenames
while IFS= read -r -d '' file; do
  WALLPAPERS+=("$file")
done < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print0)
# ----------------------------------------------------------------

# Check if any wallpapers were found
if [ ${#WALLPAPERS[@]} -eq 0 ]; then
  exit 1
fi

# Select a random wallpaper from the array of full paths
RANDOM_WALLPAPER="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"

# Set the wallpaper using the full, correct path
swww img "$RANDOM_WALLPAPER" --transition-type wipe --transition-angle 30 --transition-step 90
