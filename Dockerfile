FROM ubuntu:latest
MAINTAINER Adam Wallner <wallner@bitbaro.hu>

RUN apt-get update && apt-get upgrade -y && \
    addgroup --gid 500 core && \
    adduser --home /home/core --shell /bin/bash --uid 500 --gid 500 --disabled-password --system core && \
    addgroup --gid 253 fleet && \
    adduser core fleet && \
    addgroup --gid 233 coredocker && \
    adduser core coredocker && \
    apt-get install -y sudo net-tools inetutils-ping bash-completion mc tmux && \
    apt-get clean && \
    # This is needed by host docker
    ln -s /lib/x86_64-linux-gnu/libdevmapper.so.1.02.1 /lib/x86_64-linux-gnu/libdevmapper.so.1.02 && \
    # Sudo without password
    sed -i "s/%sudo\s*ALL=(ALL:ALL)\s*ALL/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/" /etc/sudoers && \
    # Bypass original bashrc
    mv /etc/bash.bashrc /etc/bash.basrc.coreos && \
    echo -e ". /etc/bash.bashrc.coreos\nPS1=\"\\[\\033[01;35m\\]toolbox\\[\\033[01;34m\\] $PS1\"" >/etc/bash.bashrc

WORKDIR /home/core

ENTRYPOINT ["/bin/bash"]
