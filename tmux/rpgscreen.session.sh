session_root "~/projects/rpgscreen"

VIRTUAL_ENV="$HOME/projects/rpgscreen/.virtualenv"

if initialize_session "rpgscreen"; then

  tmuxifier-tmux set-environment VIRTUAL_ENV $VIRTUAL_ENV
  load_window "vim_and_shell"

  new_window "server"
  run_cmd 'grunt'
  split_v 50
  run_cmd './manage.py runserver'

  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
