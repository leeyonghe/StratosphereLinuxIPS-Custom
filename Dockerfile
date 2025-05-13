# Use Ubuntu 22.04 as base image
FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set working directory
WORKDIR /StratosphereLinuxIPS

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-dev \
    python3-pip \
    git \
    redis-server \
    zeek \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Clone Slips repository
COPY . .

# Create and activate virtual environment
RUN python3 -m venv venv
ENV PATH="/StratosphereLinuxIPS/venv/bin:$PATH"

# Install Python dependencies
RUN pip3 install --upgrade pip && \
    pip3 install -r requirements.txt

# Set up Zeek capabilities
RUN setcap cap_net_raw,cap_net_admin=eip $(which zeek)

# Create directories for dataset and output
RUN mkdir -p /StratosphereLinuxIPS/dataset /StratosphereLinuxIPS/output

# Expose web interface port
EXPOSE 55000

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Start Redis server and run Slips
CMD service redis-server start && \
    ./slips.py -f /StratosphereLinuxIPS/dataset/*.pcap -o /StratosphereLinuxIPS/output 