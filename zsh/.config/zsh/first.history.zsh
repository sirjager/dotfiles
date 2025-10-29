# [ History Management ] ================================================
# History configuration // explicit to not nuke history
HISTFILE=${HISTFILE:-$XDG_STATE_HOME/shell_history}
HISTSIZE=100000
SAVEHIST=100000
HISTDUP=erase

setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY          # Share history between all sessions
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history
setopt HIST_IGNORE_SPACE      # Ignore commands starting with space
setopt HIST_SAVE_NO_DUPS      # Don’t save duplicate entries
setopt HIST_FIND_NO_DUPS      # Skip duplicates when searching
setopt APPEND_HISTORY         # Append, don’t overwrite history file


