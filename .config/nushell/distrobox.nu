# alias podman to podman remote if distrobox container
alias podman = if (is_distrobox) { `podman-remote` } else { `podman` }
alias docker = if (is_distrobox) { `podman-remote` } else { `podman` }
