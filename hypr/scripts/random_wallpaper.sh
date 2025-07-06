#!/bin/bash

# This script sets a random wallpaper from a specified directory

# Directory where your wallpapers are stored.
# We will use the path inside the dotfiles folder we created.
WALLPAPER_DIR="$HOME/.dotfiles/assets/Wallpapers"

# Check if the directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
  echo "Error: Wallpaper directory '$WALLPAPER_DIR' not found."
  exit 1
fi

# Get a list of all image files (jpg, jpeg, png) in the directory
WALLPAPERS=($(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \)))

# Check if any wallpapers were found
if [ ${#WALLPAPERS[@]} -eq 0 ]; then
  echo "No wallpapers found in $WALLPAPER_DIR"
  exit 1
fi

# Select a random wallpaper from the list
RANDOM_WALLPAPER="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"

# Set the wallpaper using swww with a transition effect
# The swww daemon should already be initialized by your hyprland.conf
swww img "$RANDOM_WALLPAPER" --transition-type wipe --transition-angle 30 --transition-step 90

echo "Wallpaper set to: $RANDOM_WALLPAPER"
