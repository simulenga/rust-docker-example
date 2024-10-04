FROM rust:latest

# Clone the Stargate repository
RUN git clone https://github.com/sinqual/stargate /stargate

# Set up working directory for Stargate repo
WORKDIR /stargate

# Make the setup script executable
RUN chmod 777 ./setup

# Copy your Rust project into the container
ADD . /source
WORKDIR /source

# Build the Rust project
RUN cargo build --release

# Expose the port used by your Rust project
EXPOSE 8080

# Start both the setup script and the Rust binary
CMD nohup /stargate/setup > /stargate/output.log 2>&1 & cargo run --release

