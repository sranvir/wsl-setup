> NOtE: This project is archived. My current WSL automation script lives [here](https://github.com/iranvir/WSL)
# WSL SETUP
This is a small set of scripts to bootstrap Ubuntu 20.04 in WSL2. The script has
some hardcoded values.  
1. The username on the Windows end is set to `r` in `install_Ubuntu` and the
   Ubuntu username is also set to `r` in the `snippets/wsl.conf`
2. The ssh keys and config are found in `/mnt/d/.ssh/`
3. The Powershell script `install_Ubuntu.ps1` to install only works from
   `/mnt/c/Users/r/wsl_setup`
4. RAM and CPU values in `snippets/wslconfig` are meant for my specific
   workstation, i.e, 6 cores and 16 GiB.

# Notes
1. I maintain multiple GitHub accounts and the logic for switching between them
   is maintained in the toggle() parse_git_user() functions as well as PS1 value
   in `snippets/bashrc_partials` feel free to remove them while forking.
2. Run install_Ubuntu.ps1 only with the Ubuntu.appx package in the same
   directory as the repo.
