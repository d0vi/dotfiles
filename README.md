# dotfiles

Opinionated configuration files to recreate my cozy setup by leveraging [chezmoi](https://chezmoi.io) dotfiles manager.

### Getting started

Bootstrapping a new system is super simple, just paste this two lines to a terminal and let chezmoi do its magic 🪄️
```
export GITHUB_USERNAME=d0vi
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply $GITHUB_USERNAME
```

### Not automated yet

#### Start the Podman socket service

Enable and start the Podman socket service to provide Docker-compatible API access:
```
systemctl --user enable --now podman.socket
```

Verify the socket is running:
```
systemctl --user status podman.socket
```

The socket will be available at `/run/user/$UID/podman/podman.sock` and will automatically start on future logins.

