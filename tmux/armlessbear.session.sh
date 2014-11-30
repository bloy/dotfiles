session_root "~/projects/armlessbear"

if initialize_session "armlessbear"; then

  load_window "vim_and_shell"
  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
