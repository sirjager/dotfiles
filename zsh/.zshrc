# ~/.zshrc
# Keep these two lines in top
export _zsh_start_time=$EPOCHREALTIME
source ~/.config/zsh/skip.zinit.zsh
source ~/.config/zsh/skip.helper.zsh
_zshrc_timer start


# [ Load first.*.zsh files ] ============================================
for f in "$ZSH_CONFIG_DIR"/first.*.zsh(Nn); do
  [[ "$f" == *skip.*.zsh ]] && continue
  source "$f"
done

# [ Load middle *.zsh files ] ===========================================
for f in "$ZSH_CONFIG_DIR"/*.zsh(Nn); do
  [[ "$f" == *first.*.zsh || "$f" == *last.*.zsh || "$f" == *skip.*.zsh ]] && continue
  source "$f"
done


# ==================[ Configurations Start ] =====================
# ==================[ Configurations Start ] =====================

# Attach existing tmux session if not attached, else new session
if [ -z "$TMUX" ] && command -v tmux >/dev/null 2>&1; then
  tmux attach-session \
    -t "$(tmux list-sessions \
    -F "#{session_id}" 2>/dev/null | head -n 1)" || \
    tmux new-session
fi

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# ==================[ Configurations End ] =====================
# ==================[ Configurations End ] =====================


# [ Load last.*.zsh files ] =============================================
for f in "$ZSH_CONFIG_DIR"/last.*.zsh(Nn); do
  [[ "$f" == *skip.*.zsh ]] && continue
  source "$f"
done

_zshrc_timer end
