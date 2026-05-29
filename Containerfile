FROM docker.io/dustynv/ros:humble-ros-base-l4t-r35.3.1

LABEL org.opencontainers.image.authors="Daniele Tricoli <eriol@mornie.org>" \
      org.opencontainers.image.source="https://github.com/eriol/oci-go2-humble-jetson"

ADD https://raw.githubusercontent.com/ros/rosdistro/master/ros.key /tmp/ros.key

RUN set -eux; \
    mkdir -p /usr/share/keyrings; \
    cp /tmp/ros.key /usr/share/keyrings/ros-archive-keyring.gpg; \
    cp /tmp/ros.key /usr/share/keyrings/ros2-archive-keyring.gpg; \
    rm -rf /var/lib/apt/lists/*; \
    apt-get update

RUN test -e /opt/ros/humble/setup.bash || \
    ln -s /opt/ros/humble/install/setup.bash /opt/ros/humble/setup.bash
