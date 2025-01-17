FROM ubuntu:20.04

ARG RUNNER_VERSION="2.317.0"
ARG DEBIAN_FRONTEND=noninteractive

# Update and upgrade the system
RUN apt update -y && apt upgrade -y

# Add a user named docker
RUN useradd -m docker

# Install necessary packages
RUN apt install -y --no-install-recommends \
    curl build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip jq unzip
RUN apt-get -yqq install ssh
# Set up the actions runner
RUN cd /home/docker && curl -o actions-runner-linux-x64-2.321.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.321.0/actions-runner-linux-x64-2.321.0.tar.gz && tar xzf ./actions-runner-linux-x64-2.321.0.tar.gz
# Change ownership to docker user and install dependencies
RUN chown -R docker /home/docker

COPY ./start.sh /home/docker/start.sh

RUN chmod +x /home/docker/start.sh

# Switch to docker user
USER docker

# Define the entrypoint
ENTRYPOINT ["/home/docker/start.sh"]
