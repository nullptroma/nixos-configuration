{ pkgs, writeShellApplication }: 
writeShellApplication {
  name = "hyprlock-layout";

  runtimeInputs = with pkgs; [ hyprland jq ];

  text = ''
    if [ "$1" == save ]; then
      cur=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "at-translated-set-2-keyboard") | .active_keymap' | cut -c 1-2 | tr '[:upper:]' '[:lower:]')
      echo "$cur" > ~/.cache/save-layout
      hyprctl switchxkblayout at-translated-set-2-keyboard 0      # set engl
    elif [ "$1" == restore ]; then
      prev=$(cat ~/.cache/save-layout)
      if [ "$prev" == ru ]; then
        hyprctl switchxkblayout at-translated-set-2-keyboard 1
      else
        hyprctl switchxkblayout at-translated-set-2-keyboard 0
      fi;
    fi
  '';
}