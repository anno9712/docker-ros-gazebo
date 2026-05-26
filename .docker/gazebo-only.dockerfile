FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install basic utilities
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sudo curl wget lsb-release gnupg ca-certificates \
    vim net-tools htop nano \
    && rm -rf /var/lib/apt/lists/*

# Locale for UTF-8
RUN apt-get update && \
    apt-get install -y --no-install-recommends locales tzdata && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8

# Install Gazebo Harmonic
RUN curl -fsSL https://packages.osrfoundation.org/gazebo.gpg \
        -o /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] \
        http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" \
        | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \
    apt-get update && \
    apt-get install -y --no-install-recommends gz-harmonic \
    && rm -rf /var/lib/apt/lists/*

RUN echo "export PS1='\[\e[1;33m\]\u@gazebo-docker\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '" >> /root/.bashrc

WORKDIR /root
