#!/bin/sh

# =====================================================================
# 🧱 ZLE-SAFE WRAPPER — run external commands without freezing terminal
# =====================================================================
_zle_wrap() {
  local func="$1"
  shift
  zle -I                # clear pending input
  (
    setopt localoptions noautomenu noautoremoveslash noautolist nocorrect
    "$func" "$@"        # run the user-defined function
    setopt automenu autoremoveslash autolist correct
  )
  local _exit=$?        # store exit code safely
  zle reset-prompt      # refresh prompt after command
  return $_exit
}

# =====================================================================
# ⚙️  SAFE BIND HELPER — register function as ZLE widget via _zle_wrap
# =====================================================================
_bindkey() {
  local key="$1"
  local func="$2"
  # create a temporary wrapper widget name
  local widget_name="_zle_widget_${func}"
  # define a widget that runs through _zle_wrap
  eval "
  ${widget_name}() {
    _zle_wrap ${func}
  }
  "
  zle -N "${widget_name}"
  bindkey "${key}" "${widget_name}"
}

# =================================================================================================================================
# ⚠️ Zsh Keybinding Reference — Safe vs Unsafe Key Combos
# =================================================================================================================================
#  NOTE: Some control sequences overlap with essential keys (Tab, Enter, Backspace, Delete).
#        Avoid rebinding them unless you *really* know what you’re doing.
#
#  LEGEND:
#   ^X     = Ctrl + X
#   \eX    = Alt + X
#   ^[X    = Alt + X (alternative notation)
#   ^[^X   = Ctrl + Alt + X
#   ^[[1;6X = Ctrl + Shift + X   (terminal-dependent, may vary)
#   ^[[1;4X = Alt + Shift + X    (terminal-dependent, may vary)
#
# =================================================================================================================================
# ⚠️ AVOID THESE (they’re bound to system/editor functions)
# =================================================================================================================================
# ^I   → Tab (used for completion)
# ^M   → Enter / Return
# ^H   → Backspace
# ^?   → Delete
# ^L   → Clear screen (useful default)
# ^S/^Q → Terminal flow control (pause/resume)
# =================================================================================================================================
# ✅ SAFE RECOMMENDED COMBOS
# =================================================================================================================================
#  Single modifiers:
#   ^N   → Ctrl + N
#   ^P   → Ctrl + P
#   ^E   → Ctrl + E
#   ^K   → Ctrl + K
#   ^T   → Ctrl + T
#
#  Alt combinations:
#   \en  → Alt + N
#   \ep  → Alt + P
#   \ei  → Alt + I
#   \eu  → Alt + U
#   \er  → Alt + R
#
#  Ctrl + Alt combinations:
#   ^[^N → Ctrl + Alt + N
#   ^[^P → Ctrl + Alt + P
#   ^[^I → Ctrl + Alt + I
#   ^[^U → Ctrl + Alt + U
#
#  Ctrl + Shift combinations (may vary by terminal):
#   "^[[1;6N" → Ctrl + Shift + N
#   "^[[1;6P" → Ctrl + Shift + P
#   "^[[1;6I" → Ctrl + Shift + I
#   "^[[1;6U" → Ctrl + Shift + U
#
#  Alt + Shift combinations (may vary by terminal):
#   "^[[1;4N" → Alt + Shift + N
#   "^[[1;4P" → Alt + Shift + P
#   "^[[1;4I" → Alt + Shift + I
#   "^[[1;4U" → Alt + Shift + U
# =================================================================================================================================
# 🧠 Tips:
#   - Use `bindkey | grep <char>` to inspect existing bindings.
#   - You can reset Tab completion if overwritten:
#         bindkey '^I' expand-or-complete
#   - Use descriptive widgets (e.g., `_nvim`, `_rebos_add`) for clarity.
# =================================================================================================================================





