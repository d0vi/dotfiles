#!/bin/bash

sudo ln -sf "$PWD/.dnf.conf" /etc/dnf/dnf.conf

echo "✅️ A new symlink pointing to the DNF configuration file on '/etc/dnf/dnf.conf' has been created"
