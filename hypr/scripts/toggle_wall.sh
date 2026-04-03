#!/bin/bash

WALLPAPER=$(zenity --file-selection --title="Selecionar Wallpaper" --file-filter='Imagens (png, jpg, jpeg) | *.png *.jpg *.jpeg')

[ -z "$WALLPAPER" ] && exit

HYPRPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"
HYPRLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"

# --- ATUALIZAÇÃO HYPRPAPER ---
if [ -f "$HYPRPAPER_CONF" ]; then
    sed -i "s|preload = .*|preload = $WALLPAPER|g" "$HYPRPAPER_CONF"
    sed -i "s|path = .*|    path = $WALLPAPER|g" "$HYPRPAPER_CONF"
    
    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper ",$WALLPAPER"
    hyprctl hyprpaper unload all
fi

# --- ATUALIZAÇÃO HYPRLOCK ---
if [ -f "$HYPRLOCK_CONF" ]; then
    sed -i "s|path = .*|    path = $WALLPAPER|g" "$HYPRLOCK_CONF"
fi

notify-send "Wallpaper aplicado" "Wallpaper atualizado no Hyprpaper e Hyprlock." --icon="$WALLPAPER"
