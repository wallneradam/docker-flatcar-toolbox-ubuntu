# docker-flatcar-toolbox-ubuntu

[Flatcar Container Linux](https://www.flatcar.org/) (former CoreOS) is a minimal linux distribution with Docker as package manager. Because of this it lacks of tools like tmux. Fortunately you can use Flatcar's `toolbox` to install any distribution and tools into a container. This way you can use your default distro under Flatcar. Toolbox uses systemd-nspawn to start container, but you don't need to bootstrap, because it uses Docker images as a base. [More information](https://www.flatcar.org/docs/latest/setup/debug/install-debugging-tools/).

This is an Ubuntu Linux based toolbox for Flatcar Linux. With this you can install any tool you found in Ubuntu's apt package manager. It is configured to be able to use the most important tools in the container and you see similar environment.

## Install

- Copy the [.toolboxrc](https://raw.githubusercontent.com/wallneradam/docker-flatcar-toolbox-ubuntu/master/.toolboxrc) file into /home/core/.toolboxrc
- Start "toolbox" command

After install you can remove the docker image, no longer needed (because it is extracted to /var/lib/toolbox):
```
docker rmi wallneradam/docker-coreos-toolbox-ubuntu
```

## Features

- Full Ubuntu server, with all of its tools
- Similar environment as base Flatcar
- Using the core user as default with it's home directory mounted
- Flatcar root directory is mounted under /media/root
- Flatcar tools are usable: etcdctl, even docker
- Apt package manager to install any deb packages
- tmux, Midnight Commander, etc.

## Usage

Just start toolbox command. You will be in a virtual machine (used with systemd-nspawn) with most
Flatcar tools working like etcdctl and docker.

### How to use tmux on Flatcar

With this toolbox, you can just run:
```bash
toolbox tmux
```
If you detach it, it is running in the background, so you can reattach it again with:
```bash
toolbox tmux attach -t 0
```
