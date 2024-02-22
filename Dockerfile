FROM ubuntu:latest
LABEL maintainer="Adam Wallner <adam.wallner@gmail.com>"

RUN \
    # Upgrade
    apt-get update && apt-get upgrade -y && \
    # Add needed users and groups
    addgroup --gid 500 core && \
    adduser --home /home/core --shell /bin/bash --uid 500 --gid 500 --disabled-password --system core && \
    addgroup --gid 253 fleet && \
    adduser core fleet && \
    addgroup --gid 232 etcd && \
    adduser --uid 232 --gid 232 --home /var/lib/etcd --shell /bin/false --disabled-password --system etcd && \
    adduser core etcd && \
    addgroup --gid 233 coredocker && \
    adduser core coredocker && \
    addgroup --gid 248 core-systemd-journal && \
    adduser core core-systemd-journal && \
    adduser core sudo && \
    # Install needed packages
    apt-get install -y debconf-utils && \
    echo "tzdata tzdata/Areas select Europe" | debconf-set-selections && \
    echo "tzdata tzdata/Zones/Europe select Budapest" | debconf-set-selections && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y ubuntu-server sudo net-tools inetutils-ping bash-completion mc tmux openssh-client strace netcat && \
    # Sudo without password
    sed -i "s/%sudo\s*ALL=(ALL:ALL)\s*ALL/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/" /etc/sudoers && \
    # Add core user to sudoers
    adduser core sudo && \
    # Bypass original bashrc
    mv /etc/bash.bashrc /etc/bash.bashrc.coreos && \
    echo ". /etc/bash.bashrc.coreos\nPS1=\"\\[\\033[01;35m\\]toolbox-ubuntu\\[\\033[01;34m\\] \$PS1\"" >/etc/bash.bashrc && \
    # Ensure machine-id (this is intentionally fixed)
    echo "d7f78490382fccf97ebea1b365c692f6" >/etc/machine-id && \
    # Cleanup
    apt-get clean

WORKDIR /home/core

ENTRYPOINT ["/bin/bash"]
