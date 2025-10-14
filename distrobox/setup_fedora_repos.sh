#!/bin/bash

# add nushell repo
nushell_repo_path="/etc/yum.repos.d/fury-nushell.repo"
if [ ! -f $nushell_repo_path ]
then
    echo "[gemfury-nushell]
name=Gemfury Nushell Repo
baseurl=https://yum.fury.io/nushell/
enabled=1
gpgcheck=0
gpgkey=https://yum.fury.io/nushell/gpg.key" | sudo tee "${nushell_repo_path}"
fi

# add carapace repo (for autocompletion)
carapace_repo_path="/etc/yum.repos.d/fury-carapace.repo"
if [ ! -f $carapace_repo_path ]
then
    echo "[fury-carapace]
name=Gemfury Carapace Repo
baseurl=https://yum.fury.io/rsteube/
enabled=1
gpgcheck=0" | sudo tee "${carapace_repo_path}"
fi

# enable copr repo for yazi file manager
sudo dnf copr enable lihaohong/yazi -y

# enable copr repo for lazygit
sudo dnf copr enable dejan/lazygit -y
