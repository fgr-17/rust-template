FROM rust:1.90-bullseye

ENV PROJECT_NAME=${PROJECT_NAME}

ENV PROJDIR=/workspace/${PROJECT_NAME}
ENV SCRIPTS_DIR=./scripts

# to run mockall
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    make \
    protobuf-compiler \
    flatbuffers-compiler \
    && rm -rf /var/lib/apt/lists/*

RUN rustup update && rustup component add clippy rustfmt llvm-tools
RUN cargo install cargo-llvm-cov --locked

# Add ll alias for colored ls -la
RUN echo "alias ll='ls -la --color=auto'" >> /etc/bash.bashrc

# Set ENV so ash shell sources aliases for all interactive shells
ENV BASH_ENV=/etc/bash.bashrc

COPY ${SCRIPTS_DIR}/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]


