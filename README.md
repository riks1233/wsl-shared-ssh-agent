# wsl-shared-ssh-agent

Small script to re-connect to an already running SSH Agent instance, when instantiating a new wsl shell.

# Installation

- Download the code anywhere. For example `git clone https://github.com/riks1233/wsl-shared-ssh-agent.git $HOME/.wsl-shared-ssh-agent`
- Source it in your shell's source file. For example, put `source $HOME/.wsl-shared-ssh-agent/launch.sh` line in either `.bashrc`, `.bash_profile`, `.zshrc`, `.zprofile`, etc., depending on your shell.
- Restart your shell or re-source your shell's source file.
