# docker-coreos-toolbox-ubuntu

[CoreOS](https://coreos.com) is a minimal linux distribution with Docker as package manager. Because of this it lacks of tools like tmux. Fortunatelly you can use CoreOS toolbox to install any distribution and tools into a container. This way you can use your default distro under CoreOS. Toolbox uses systemd-nspawn to start container, but you don't need to bootstrap, because it uses Docker images as a base. More information: https://coreos.com/os/docs/latest/install-debugging-tools.html .

This is an Ubuntu Linux based toolbox for CoreOS. With this you can install any tool you found in Ubuntu's apt package manager. It is configured to be able to use the most important tools in the container and you see similar environment.

We use this solution in production on our classified-ad site: [apro.hu](http://apro.hu)

## Install

- Copy the .toolboxrc file into /home/core/.toolboxrc
- Start "toolbox" command

After install you can remove the docker image, no longer needed (it is extracted to /var/lib/toolbox):
```
docker rmi pickapp/docker-coreos-toolbox-ubuntu
```

## Features

- Full Ubuntu server, with all of its tools
- Similar environment as base CoreOS
- Using the core user as default with it's home directory mounted
- CoreOS root directory is mounted under /media/root
- CoreOS tools are usable: etcdctl, fleetctl, even docker
- Apt package manager to install any deb packages
- tmux, Midnight Commander, etc.

## Usage

Just start toolbox command. You will be in a virtual machine (used with systemd-nspawn) with most
CoreOS tools working like fleetctl, etcdctl and docker.

### How to use tmux on CoreOS

With this toolbox, you can just run:
```
toolbox tmux
```
If you detach it, it is running in the background, so you can reattach it again with:
```
toolbox tmux attach -t 0
```

Inside tmux you can monitor your services with flettctl and etcdctl or even with docker. Eg.:
```
watch -t -n1 fleetctl list-units -no-legend
fleetctl journal -f loadbalancer
```
