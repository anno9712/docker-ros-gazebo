ARG ROS_DISTRO="jazzy"
FROM osrf/ros:${ROS_DISTRO}-desktop-full

# Install basic utilities
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sudo vim curl wget git build-essential cmake \
    python3-pip python3-venv python-is-python3 \
    net-tools htop nano \
    && rm -rf /var/lib/apt/lists/*

# Locale for UTF-8
RUN apt-get update && \
    apt-get install -y --no-install-recommends locales tzdata && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8

# Source ROS on shell startup
RUN echo "source /opt/ros/jazzy/setup.bash" >> /root/.bashrc && \
    echo "export PS1='\[\e[1;36m\]\u@ros-docker\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '" >> /root/.bashrc

WORKDIR /root
