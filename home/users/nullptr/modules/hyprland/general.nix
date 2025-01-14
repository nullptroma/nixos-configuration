{
  monitor = [
    "eDP-1,highres,0x0,1.666667"
    "HDMI-A-1,highres,auto,1,mirror,eDP-1"
  ];
  xwayland.force_zero_scaling = true;

  input = {
    # Keyboard: Add a layout and uncomment kb_options for Win+Space switching shortcut
    kb_layout = "us, ru";
    kb_options = "grp:alt_shift_toggle";
    repeat_delay = 250;
    repeat_rate = 35;

    touchpad = {
        natural_scroll = false;
        disable_while_typing = false;
        clickfinger_behavior = true;
        scroll_factor = 1;
    };
    
    special_fallthrough = true;
    follow_mouse = 1;
  };

  binds = {
    # focus_window_on_workspace_c # For Auto-run stuff see execs.confhange = true
    scroll_event_delay = 0;
  };

  gestures = {
      workspace_swipe = true;
      workspace_swipe_distance = 700;
      workspace_swipe_fingers = 3;
      workspace_swipe_cancel_ratio = 0.2;
      workspace_swipe_min_speed_to_force = 5;
      workspace_swipe_direction_lock = true;
      workspace_swipe_direction_lock_threshold = 10;
      workspace_swipe_create_new = true;
  };

  general = {
    # Gaps and border
    gaps_in = 4;
    gaps_out = 5;
    gaps_workspaces = 50;
    border_size = 1;

    # Fallback colors
    #col.active_border = "rgba(0DB7D4FF)";
    #col.inactive_border = "rgba(31313600)";

    resize_on_border = true;
    no_focus_fallback = true;
    layout = "dwindle";

    # focus_to_other_workspaces = true # ahhhh i still haven't properly implemented this
    allow_tearing = true; # some guy told me tearing might make things smoother idk
  };

  dwindle = {
	  preserve_split = true;
    # no_gaps_when_only = 1
	  smart_split = false;
	  smart_resizing = false;
  };

  decoration = {
    rounding = 20;

    blur = {
      enabled = true;
      xray = true;
      special = false;
      new_optimizations = true;
      size = 7;
      passes = 4;
      brightness = 1;
      noise = 0.01;
      contrast = 1;
      popups = true;
      popups_ignorealpha = 0.6;
    };

    # Shadow
    shadow = {
      range = 20;
      offset = "0 2";
      render_power = 4;
    };
    #col.shadow = "rgba(0000002A)";

    # Shader
    # screen_shader = ~/.config/hypr/shaders/nothing.frag
    # screen_shader = ~/.config/hypr/shaders/vibrance.frag

    # Dim
    dim_inactive = false;
    dim_strength = 0.1;
    dim_special = 0;
  };

  animations = {
    enabled = true;
    # Animation curves
    bezier = [
      "linear, 0, 0, 1, 1"
      "md3_standard, 0.2, 0, 0, 1"
      "md3_decel, 0.05, 0.7, 0.1, 1"
      "md3_accel, 0.3, 0, 0.8, 0.15"
      "overshot, 0.05, 0.9, 0.1, 1.1"
      "crazyshot, 0.1, 1.5, 0.76, 0.92"
      "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
      "menu_decel, 0.1, 1, 0, 1"
      "menu_accel, 0.38, 0.04, 1, 0.07"
      "easeInOutCirc, 0.85, 0, 0.15, 1"
      "easeOutCirc, 0, 0.55, 0.45, 1"
      "easeOutExpo, 0.16, 1, 0.3, 1"
      "softAcDecel, 0.26, 0.26, 0.15, 1"
      "md2, 0.4, 0, 0.2, 1" # use with .2s duration
    ];

    animation = [
      # Animation configs
      "windows, 1, 3, md3_decel, popin 60%"
      "windowsIn, 1, 3, md3_decel, popin 60%"
      "windowsOut, 1, 3, md3_accel, popin 60%"
      "border, 1, 10, default"
      "fade, 1, 3, md3_decel"
      "layersIn, 1, 3, menu_decel, slide"
      "layersOut, 1, 1.6, menu_accel"
      "fadeLayersIn, 1, 2, menu_decel"
      "fadeLayersOut, 1, 4.5, menu_accel"
      "workspaces, 1, 7, menu_decel, slide"
      "specialWorkspace, 1, 3, md3_decel, slidevert"
    ];
    # animation = layers, 1, 2, md3_decel, slide
    # animation = workspaces, 1, 2.5, softAcDecel, slide
    # animation = workspaces, 1, 7, menu_decel, slidefade 15%
    # animation = specialWorkspace, 1, 3, md3_decel, slidefadevert 15%
  };

  misc = {
    vfr = 1;
    vrr = 1;
    # layers_hog_mouse_focus = true
    focus_on_activate = true;
    animate_manual_resizes = false;
    animate_mouse_windowdragging = false;
    enable_swallow = false;
    swallow_regex = "(foot|kitty|allacritty|Alacritty)";
    initial_workspace_tracking = 0;
    disable_hyprland_logo = true;
    force_default_wallpaper = 0;
    new_window_takes_over_fullscreen = 2;
    allow_session_lock_restore = true;
  };

  cursor = {
    enable_hyprcursor = true;
  };

  # Overview
  plugin = {
    hyprexpo = {
      columns = 3;
      gap_size = 5;
      bg_col = "rgb(000000)";
      workspace_method = "first 1"; # [center/first] [workspace] e.g. first 1 or center m+1
      
      enable_gesture = false; # laptop touchpad, 4 fingers
      gesture_distance = 300; # how far is the "max"
      gesture_positive = false;
    };
  };
}