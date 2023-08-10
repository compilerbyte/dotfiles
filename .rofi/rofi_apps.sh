#!/bin/bash

selected_category=$(echo -e "web_apps\noffice_apps\nmedia_apps\ngraphics_apps" | rofi -dmenu -p "Select category")

case "$selected_category" in
    web_apps)
        apps_dir=~/.config/rofi/web_apps
        ;;
    office_apps)
        apps_dir=~/.config/rofi/office_apps
        ;;
    media_apps)
        apps_dir=~/.config/rofi/media_apps
        ;;
    graphics_apps)
        apps_dir=~/.config/rofi/graphics_apps
        ;;
    *)
        exit 1
        ;;
esac

chosen_app=$(ls "$apps_dir" | sed 's/\.sh$//' | rofi -dmenu -p "Select app")

if [ -n "$chosen_app" ]; then
    sh "$apps_dir/$chosen_app.sh" &
fi

