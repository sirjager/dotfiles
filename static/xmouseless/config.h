
/* the rate at which the mouse moves in Hz
 * does not change its speed */
static const unsigned int move_rate = 50;

/* the default speed of the mouse pointer
 * in pixels per second */
static const unsigned int default_speed = 500;

/* changes the speed of the mouse pointer */
static SpeedBinding speed_bindings[] = {
    /* key             speed */  
    // { XK_Super_L,      3000 },
    { XK_Shift_L,      3000 },
    { XK_Alt_L,        1500 },
    { XK_Control_L,    100 },
    { XK_Super_L,      10 },
};

/* moves the mouse pointer
 * you can also add any other direction (e.g. diagonals) */
static MoveBinding move_bindings[] = {
    /* key         x      y */
    { XK_h,        -1,     0 }, // left 
    { XK_l,         1,     0 }, // right
    { XK_k,         0,    -1 }, // up 
    { XK_j,         0,     1 }, // down
};

/* 1: left
 * 2: middle
 * 3: right */
static ClickBinding click_bindings[] = {
    /* key         button */  
    { XK_f,        1 }, 
    { XK_m,        2 },
    { XK_r,        3 },
};

/* scrolls up, down, left and right
 * a higher value scrolls faster */
static ScrollBinding scroll_bindings[] = {
    /* key        x      y */
    { XK_s,        0,    15 },
    { XK_w,        0,   -15 },
    { XK_d,        25,    0 },
    { XK_a,       -25,    0 },
    { XK_plus,     0,    80 },
    { XK_minus,    0,   -80 },
};

/* executes shell commands */
static ShellBinding shell_bindings[] = {
    /* key         command */  
    { XK_x,        "xdotool mousedown 1" }, // highlight | drag & drop begin
    { XK_c,        "xdotool mouseup 1" },   // highlight | drag & drop end
    { XK_y,        "xdotool ctrl+c" },      // copy to clipboard
};

/* exits on key release which allows click and exit with one key */
static KeySym exit_keys[] = {
    XK_Escape, XK_q, XK_backslash
};
