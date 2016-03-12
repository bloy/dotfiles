session_root "~/projects/rpgscreen"

export VIRTUAL_ENV="$HOME/.local/share/virtualenvs/rpgscreen"

if initialize_session "rpgscreen"; then

  tmuxifier-tmux set-environment VIRTUAL_ENV $VIRTUAL_ENV
  load_window "vim_and_shell"

  new_window "server"
  run_cmd 'make watch'
  split_v 50
  run_cmd 'make serve'

  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
