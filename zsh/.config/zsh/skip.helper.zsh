# =====================================================================
# Modular Zsh Config Loader
# Loads in order:
#   1. *.start.zsh → early configs
#   2. *.zsh (normal) → standard configs
#   3. *.end.zsh → final configs (e.g., keybinds)
# Skips:
#   - *.skip.zsh → ignored completely
# Supports:
#   - Numeric prefixes like 0_, 1_, 2_ to control order within each group
# =====================================================================


# =====================================================================
# Zshrc Load Timer Helper
# Usage:
#   _zshrc_timer start   → mark start time
#   _zshrc_timer end     → mark end time and print duration
# =====================================================================
function _zshrc_timer() {
  local action=$1

  case "$action" in
    start)
      # record start time
      _ZSHRC_START_TIME=$EPOCHREALTIME
      ;;
    end)
      # calculate and show duration
      local start=${_ZSHRC_START_TIME:-$EPOCHREALTIME}
      local diff
      diff=$(awk -v start="$start" -v end="$EPOCHREALTIME" 'BEGIN { printf "%.2f", (end - start) }')

      # show only for interactive shells
      [[ $- == *i* ]] && echo -e "\e[2m[ zshrc loaded in ${diff}s ]\e[0m"

      # keep internal for reference (not exported)
      _zsh_load_time="${diff}s"

      unset _ZSHRC_START_TIME
      ;;
    *)
      echo "Usage: _zshrc_timer {start|end}" >&2
      return 1
      ;;
  esac
}
