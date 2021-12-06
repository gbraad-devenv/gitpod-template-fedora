FROM registry.fedoraproject.org/fedora-minimal:latest

USER root

# Needed for the experimental network mode (to support Tailscale)
RUN curl -o /usr/bin/slirp4netns -fsSL https://github.com/rootless-containers/slirp4netns/releases/download/v1.1.12/slirp4netns-$(uname -m) \
    && chmod +x /usr/bin/slirp4netns

# Install user environment
RUN groupadd gitpod && adduser -g gitpod gitpod
CMD /bin/bash -l
USER gitpod
ENV USER gitpod
WORKDIR /home/gitpod

