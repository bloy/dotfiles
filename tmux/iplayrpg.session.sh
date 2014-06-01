session_root "~/projects/iplayrpg"

VIRTUAL_ENV=`pew in iplayrpg env | grep VIRTUAL_ENV | cut -d= -f 2`

if initialize_session "iplayrpg"; then

  tmuxifier-tmux set-environment VIRTUAL_ENV $VIRTUAL_ENV
  load_window "vim_and_shell"
  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
