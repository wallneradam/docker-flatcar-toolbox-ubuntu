# docker-coreos-toolbox-ubuntu

Ubuntu Linux based toolbox for CoreOS. More information: https://coreos.com/os/docs/latest/install-debugging-tools.html

## Install

- Copy the .toolboxrc file into /home/core/.toolboxrc

## Usage

Just start toolbox command. You will be in a virtual machine (used with systemd-nspawn) with most
CoreOS tools working like fleetctl, etcdctl and docker.

## Features

- Full Ubuntu server, with all of its tools
- CoreOS tools are usable
- Apt package manager
- tmux, Midnight Commander, etc.
