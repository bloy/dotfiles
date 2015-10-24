session_root "~/ansible"

if initialize_session "ansible"; then
  new_window 'roles'
  split_v 25
  run_cmd "cd roles" 0
  run_cmd "cd roles" 1
  run_cmd "vim" 0

  new_window 'playbooks'
  split_v 25
  run_cmd "cd playbooks" 0
  run_cmd "cd playbooks" 1
  run_cmd "vim" 0

  new_window 'inventory'
  split_v 25
  run_cmd "cd inventory" 0
  run_cmd "cd inventory" 1
  run_cmd "vim" 0

  new_window 'runner'
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
