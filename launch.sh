#!/bin/bash

script_dir="$(dirname "$BASH_SOURCE")"
# "env file" to store running SSH Agent's environment variables.
env_file="$script_dir/.env"

print() {
  local prefix="[wsl-ssh-agent-launcher]:"
  echo "$prefix $*"
}

# Check if ssh-agent is running for the current user.
if pgrep -u "$USER" ssh-agent >/dev/null; then
  print "ssh-agent is already running."
  if [[ -f $env_file ]]; then
    # Evaluate the stored environment variables from env file.
    eval "$(cat $env_file)"
  else
    print "Unable to locate $env_file file, this shouldn't happen."
  fi

else
  print "Starting ssh-agent."
  # Start the SSH Agent and store its environment variables in env file.
  ssh-agent -s >$env_file
  # Restrict env file permissions.
  chmod 600 $env_file
  # Evaluate the stored environment variables.
  eval "$(cat $env_file)"
  # Run an ssh-add command for convenience. Can always be interrupted.
  ssh-add
fi
