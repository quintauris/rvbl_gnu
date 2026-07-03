# Copyright 2026 Quintauris GmbH
# Licensed under the Apache License, Version 2.0 (the "License").
# https://www.apache.org/licenses/LICENSE-2.0

FROM ubuntu:noble

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y cmake=3.28.3-1build7
RUN apt-get install -y gcc-riscv64-unknown-elf=13.2.0-11ubuntu1+12
RUN apt-get install -y asciidoctor
RUN apt-get install -y libglib2.0-dev
RUN apt-get install -y git
RUN apt-get install -y rustup
RUN rustup default 1.90
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
