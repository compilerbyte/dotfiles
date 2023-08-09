#!/bin/bash

selected_category=$(echo -e "web_apps\noffice_apps\nmedia_apps" | rofi -dmenu -p "Select category")

case "$selected_category" in
    web_apps)
        apps=$(cat ~/.config/rofi/web_apps.txt)
        ;;
    office_apps)
        apps=$(cat ~/.config/rofi/office_apps.txt)
        ;;
    media_apps)
        apps=$(cat ~/.config/rofi/media_apps.txt)
        ;;
    *)
        exit 1
        ;;
esac

chosen_app=$(echo "$apps" | rofi -dmenu -p "Select app")

if [ -n "$chosen_app" ]; then
    "$chosen_app" &
fi

