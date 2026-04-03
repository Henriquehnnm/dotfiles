#!/usr/bin/env bash

WALLPAPER=$(zenity --file-selection --title="Selecionar Wallpaper" --file-filter='Imagens (png, jpg, jpeg) | *.png *.jpg *.jpeg')

[ -z "$WALLPAPER" ] && exit

CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

sed -i "s|preload = .*|preload = $WALLPAPER|g" "$CONFIG_FILE"
sed -i "s|path = .*|    path = $WALLPAPER|g" "$CONFIG_FILE"

hyprctl hyprpaper preload "$WALLPAPER"

hyprctl hyprpaper wallpaper ",$WALLPAPER"

hyprctl hyprpaper unload all

notify-send "Wallpaper atualizado" "$WALLPAPER"
