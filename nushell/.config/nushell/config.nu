# config.nu
#
# Installed by:
# version = "1.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

# source files here
source ~/.config/nushell/env.nu
source ~/.cache/nushell/zoxide.nu
source ~/.cache/nushell/carapace.nu
use ~/.cache/nushell/starship.nu

$env.config = {

  show_banner: false

  ls: {
    use_ls_colors: true # use the LS_COLORS environment variable to colorize output
    clickable_links: true # enable or disable clickable links. Your terminal has to support links.
  }

  rm: {
    always_trash: true # always act as if -t was given. Can be overridden with -p
  }

  table: {
    mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
    show_empty: true # show 'empty list' and 'empty record' placeholders for command output
    padding: { left: 1, right: 1 } # a left right padding of each column in a table
    trim: {
      methodology: wrapping # wrapping or truncating
      wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
      truncating_suffix: "..." # A suffix used by the 'truncating' methodology
    }
    header_on_separator: false # show header text on separator/border line
    # abbreviated_row_count: 10 # limit data rows from top and bottom after reaching a set point
  }

  error_style: "fancy" # "fancy" or "plain" for screen reader-friendly error messages
  
  # datetime_format determines what a datetime rendered in the shell would look like.
  # Behavior without this configuration point will be to "humanize" the datetime display,
  # showing something like "a day ago."
  datetime_format: {
    # normal: '%a, %d %b %Y %H:%M:%S %z'    # shows up in displays of variables or other datetime's outside of tables
    # table: '%m/%d/%y %I:%M:%S%p'          # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
  }


  explore: {
    status_bar_background: { fg: "#1D1F21", bg: "#C4C9C6" },
    command_bar_text: { fg: "#C4C9C6" },
    highlight: { fg: "black", bg: "yellow" },
    selected_cell: { bg: light_blue },
    status: {
      error: { fg: "white", bg: "red" },
      warn: {}
      info: {}
    },
  }
  
  history: {
    max_size: 999_999 # Session has to be reloaded for this to take effect
    sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
    file_format: "plaintext" # "sqlite" or "plaintext"
    isolation: false # only available with sqlite file_format. true enables history isolation, false disables it. true will allow the history to be isolated to the current session using up/down arrows. false will allow the history to be shared across all sessions.
  }
  
  completions: {
    case_sensitive: false # set to true to enable case-sensitive completions
    quick: true    # set this to false to prevent auto-selecting completions when only one remains
    partial: true    # set this to false to prevent partial filling of the prompt
    algorithm: "prefix"    # prefix or fuzzy
    use_ls_colors: true # set this to true to enable file/path/directory completions using LS_COLORS
    external: {
      enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
      max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
      completer: null # check 'carapace_completer' above as an example
    }
  }
  
  filesize: {
    metric: false # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
    format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, auto
  }
 
  cursor_shape: {
    emacs: block # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (line is the default)
    vi_insert: block # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (block is the default)
    vi_normal: underscore # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (underscore is the default)
  }

  footer_mode: 25 # always, never, number_of_rows, auto
  float_precision: 2 # the precision for displaying floats in tables
  buffer_editor: "" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
  use_ansi_coloring: true
  bracketed_paste: true # enable bracketed paste, currently useless on windows
  edit_mode: vi # emacs, vi

  render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.
  use_kitty_protocol: false # enables keyboard enhancement protocol implemented by kitty console, only if your terminal support this.
  highlight_resolved_externals: false # true enables highlighting of external commands in the repl resolved by which.
  recursion_limit: 50 # the maximum number of times nushell allows recursion before stopping it

  shell_integration: {
    # osc2 abbreviates the path if in the home_dir, sets the tab/window title, shows the running command in the tab/window title
    osc2: true
    # osc7 is a way to communicate the path to the terminal, this is helpful for spawning new tabs in the same directory
    osc7: true
    # osc8 is also implemented as the deprecated setting ls.show_clickable_links, it shows clickable links in ls output if your terminal supports it. show_clickable_links is deprecated in favor of osc8
    osc8: true
    # osc9_9 is from ConEmu and is starting to get wider support. It's similar to osc7 in that it communicates the path to the terminal
    osc9_9: false
    # osc133 is several escapes invented by Final Term which include the supported ones below.
    # 133;A - Mark prompt start
    # 133;B - Mark prompt end
    # 133;C - Mark pre-execution
    # 133;D;exit - Mark execution finished with exit code
    # This is used to enable terminals to know where the prompt is, the command is, where the command finishes, and where the output of the command is
    osc133: true
    # osc633 is closely related to osc133 but only exists in visual studio code (vscode) and supports their shell integration features
    # 633;A - Mark prompt start
    # 633;B - Mark prompt end
    # 633;C - Mark pre-execution
    # 633;D;exit - Mark execution finished with exit code
    # 633;E - NOT IMPLEMENTED - Explicitly set the command line with an optional nonce
    # 633;P;Cwd=<path> - Mark the current working directory and communicate it to the terminal
    # and also helps with the run recent menu in vscode
    osc633: true
    # reset_application_mode is escape \x1b[?1l and was added to help ssh work better
    reset_application_mode: true
  }

  keybindings: [
    {
      name: accept_segment_completion
      modifier: control
      keycode: char_f
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          { send: historyhintwordcomplete }
          { edit: movewordright }
        ]
      }
    }
    {
      name: capitalize_char
      modifier: alt
      keycode: char_c
      mode: emacs
      event: { edit: capitalizechar }
    }
  ]

}

# custom aliases
alias cd = z  # cd with zoxide

alias l = eza --long --icons --git # List all files and folders 
alias la = ls -a  # List all files and folders in table
alias ll = eza --icons --git # List files and folders with icons
alias lt = eza --tree --level=2 --long --icons --git # List files and folders in tree structure

alias pm-add = yay --noconfirm --needed -S # Install package if needed and skip confirmation
alias pm-remove = yay --noconfirm -Rns     # Remove packages without removing configurations
alias pm-update = yay --noconfirm -Syu     # Update packages and repositories databases
alias pm-mirrors = sudo reflector --verbose --save /etc/pacman.d/mirrorlist --sort rate -l 50 # Rank pacman mirrors list

# application specific
alias pn = pnpm # Pnpm alias

alias n = nvim # alias for neovim
alias nv = nvim # alias for neovim
alias vim = nvim # alias for neovim
alias vi = nvim # alias for neovim
alias snv = sudo -E -s nvim # alias for sudo neovim
alias svi = sudo -E -s nvim # alias for sudo neovim
