session_root "~/projects/ansible-playbooks"

if initialize_session "ansible"; then
  load_window "vim_and_shell"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
