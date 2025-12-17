CONFIG="$HOME/.config/hypr/input.conf"
STATE_FILE="$HOME/.cache/swap_caps_state"

OPT1="kb_options = grp:caps_toggle, caps:none"
OPT2="kb_options = grp:caps_toggle, caps:none, ctrl:swapcaps"

if [ -f "$STATE_FILE" ]; then
  STATE=$(cat "$STATE_FILE")
else
  STATE=0
fi

if [ "$STATE" -eq 0 ]; then
  sed -i "s|^[[:space:]]*kb_options *=.*|  $OPT2|" "$CONFIG"
  echo 1 > "$STATE_FILE"
  notify-send "󰪛  Caps Lock" "Caps Lock SWAPPED with ctrl"
else
  sed -i "s|^[[:space:]]*kb_options *=.*|  $OPT1|" "$CONFIG"
  echo 0 > "$STATE_FILE"
  notify-send "󰪛  Caps Lock" "Caps Lock DOES NOT swapped with ctrl"
fi

hyprctl reload > /dev/null
