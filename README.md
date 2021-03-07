# Ansible + Molecule Docker Image

This is a very simple image meant to run Ansible Molecule tests in a CI/CD
pipeline. It will run `molecule test --all` by default, but you should
be able to run whatever you need as a command if that suits you. Technically,
this image could be used to run playbooks as well, but that's not its primary
purpose.

# Author(s)

Dan - github.com/dudefellah
