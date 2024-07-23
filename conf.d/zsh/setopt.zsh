setopt No_Beep

# If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt AUTO_CD

# Allow comments even in interactive shells (especially for Muness)
# setopt INTERACTIVE_COMMENTS

# ===== History

# Let histfile managed by system's `fcntl` call to improve better performance and avoid corruption
setopt HIST_FCNTL_LOCK

# Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY 

# Save each command's beginning timestamp(sec), duration(sec) to the histfile
setopt EXTENDED_HISTORY

# Add comamnds as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY 

# Add EXTENDED_HISTORY format for INC_APPEND_HISTORY
setopt INC_APPEND_HISTORY_TIME

# Remove old dups commands
setopt HIST_EXPIRE_DUPS_FIRST

# Ignore all dups commands
setopt HIST_IGNORE_ALL_DUPS

# Do not write events to history that are duplicates of previous events
setopt HIST_IGNORE_DUPS

# Ignore commands when first character is space
setopt HIST_IGNORE_SPACE

# Remove superfluous blanks from each command
setopt HIST_REDUCE_BLANKS

# When searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS

# Remove old duplicate commands if newer ones are omitted
setopt HIST_SAVE_NO_DUPS

# Remove extra blanks from each command line being added to history
setopt HIST_REDUCE_BLANKS

# Include more information about when the command was executed, etc
setopt EXTENDED_HISTORY

# ===== Completion 

# Allow completion from within a word/phrase
setopt COMPLETE_IN_WORD 

# When completing from the middle of a word, move the cursor to the end of the word
setopt ALWAYS_TO_END

# ===== Prompt

# Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt PROMPT_SUBST

unsetopt MENU_COMPLETE
setopt AUTO_MENU

# vim: set ft=sh :
