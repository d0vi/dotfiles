# dotfiles

Opinionated configuration files to recreate my cozy setup by leveraging [chezmoi](https://chezmoi.io) dotfiles manager.

### Getting started

Bootstrapping a new system is super simple, just paste this two lines to a terminal and let chezmoi do its magic 🪄️
```
export GITHUB_USERNAME=d0vi
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```
