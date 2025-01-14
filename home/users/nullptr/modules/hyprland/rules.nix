{
  # ######## Window rules ########
  windowrulev2 = [
    "noblur, class:.*"
    # windowrule = opacity 0.89 override 0.89 override, .* # Applies transparency to EVERY WINDOW
    "float, class:^(blueberry.py)$"
    "float, class:^(steam)$"
    "float, class:^(guifetch)$ # FlafyDev/guifetch"
    "tile,class:(wps)"
    "tile,class:(dev.warp.Warp)"


    # Dialogs
    "float,title:^(Open File)(.*)$"
    "float,title:^(Select a File)(.*)$"
    "float,title:^(Choose wallpaper)(.*)$"
    "float,title:^(Open Folder)(.*)$"
    "float,title:^(Save As)(.*)$"
    "float,title:^(Library)(.*)$"

    # JetBrains
    # -- Fix odd behaviors in IntelliJ IDEs --
    #! Fix focus issues when dialogs are opened or closed
    # windowdance,class:^(jetbrains-.*)$,floating:1
    #! Fix splash screen showing in weird places and prevent annoying focus takeovers
    "center,class:^(jetbrains-.*)$,title:^(splash)$,floating:1"
    "nofocus,class:^(jetbrains-.*)$,title:^(splash)$,floating:1"
    "noborder,class:^(jetbrains-.*)$,title:^(splash)$,floating:1"
    #! Center popups/find windows
    "center,class:^(jetbrains-.*)$,title:^( )$,floating:1"
    "stayfocused,class:^(jetbrains-.*)$,title:^( )$,floating:1"
    "noborder,class:^(jetbrains-.*)$,title:^( )$,floating:1"
    #! Disable window flicker when autocomplete or tooltips appear
    "nofocus,class:^(jetbrains-.*)$,title:^(win.*)$,floating:1"

    # World Of Warcraft
    "fullscreen,title:^(World of Warcraft)(.*)$"
    "tile,title:^(World of Warcraft)(.*)$"

    # Okular
    "float,class:^(org.kde.okular)$,title:^(.*New Text.*)$"
    "center,class:^(org.kde.okular)$,title:^(,*New Text.*)$"
    "stayfocused,class:^(org.kde.okular)$,title:^(,*New Text.*)$"

    # eog
    "float,class:^(eog)$"
    "center,class:^(eog)$"

    # OnlyOffice
    "tile,title:^(ONLYOFFICE Desktop Editors)(.*)$"

    # Steam
    "tile,title:^(Steam)(.*)$"
    "stayfocused, title:^()$,class:^(steam)$"
    "minsize 1 1, title:^()$,class:^(steam)$"

    # Gnome Calc
    "float, class:^(org.gnome.Calculator)$"
    "center, class:^(org.gnome.Calculator)$"
    "size 400 600, class:^(org.gnome.Calculator)$"

    # Picture-in-Picture
    "float,title:^(Picture-in-Picture)$"
    "pin,title:^(Picture-in-Picture)$"
    "move 58% 61%,title:^(Picture-in-Picture)$"
    "size 45% >1,title:^(Picture-in-Picture)$"

    "float,title:^(Picture in picture)$"
    "pin,title:^(Picture in picture)$"
    "move 58% 61%,title:^(Picture in picture)$"
    "size 600 350,title:^(Picture in picture)$"
    # Yandex
    "float,title:.*- YouTube$"
    "pin,title:.*- YouTube$"
    "opacity 0.8 override 0.8 override,title:.*- YouTube$"
    "move 58% 61%,title:.*- YouTube$"
    "size 45% >1,title:.*- YouTube$"


    # pavucontrol
    "float, class:^(pavucontrol)$"
    "size 1200 800, class:^(pavucontrol)$"

    # Godot
    "stayfocused, title:^(Create New Node)$"
    "stayfocused, title:^(Instantiate Child Scene)$"
  ];
  
  layerrule = [
    "xray 1, .*"
    "noanim, walker"
    "noanim, selection"
    "noanim, overview"
    "noanim, anyrun"
    "noanim, indicator.*"
    "noanim, osk"
    "noanim, hyprpicker"
    "blur, shell:*"
    "ignorealpha 0.6, shell:*"
    "noanim, noanim"
    "blur, gtk-layer-shell"
    "ignorezero, gtk-layer-shell"
    "blur, launcher"
    "ignorealpha 0.5, launcher"
    "blur, notifications"
    "ignorealpha 0.69, notifications"
    "blur, session"
    "blur, bar"
    "ignorealpha 0.6, bar"
    "blur, corner.*"
    "ignorealpha 0.6, corner.*"
    "blur, dock"
    "ignorealpha 0.6, dock"
    "blur, indicator.*"
    "ignorealpha 0.6, indicator.*"
    "blur, overview"
    "ignorealpha 0.6, overview"
    "blur, cheatsheet"
    "ignorealpha 0.6, cheatsheet"
    "blur, sideright"
    "ignorealpha 0.6, sideright"
    "blur, sideleft"
    "ignorealpha 0.6, sideleft"
    "blur, indicator*"
    "ignorealpha 0.6, indicator*"
    "blur, osk"
    "ignorealpha 0.6, osk"
  ];
}