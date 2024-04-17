# Syncthing setup

To enable syncthing, do the following:

1. Create the ~/.config/syncthing/ directory
  - Make sure it is not a symlink
2. Run the commands shown below

```
systemctl --user daemon-reload
systemctl --user start syncthing.service
```

The following commands can help with troubleshooting:

- `systemctl --user status syncthing.service` will show the status of the syncthing container as seen by systemd
- `podman ps` will show all running containers
- `podman logs syncthing` will show all messages/logs produced by syncthing

Finally, you can find syncthing's web GUI using this link: http://localhost:8384

