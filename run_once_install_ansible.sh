#!/bin/bash

sudo dnf install -y ansible

echo "✅️ Ansible has been successfully installed"

ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass

echo "✅️ Ansible playbook run has been completed"
