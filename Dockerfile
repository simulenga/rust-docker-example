FROM rust:latest


# Copy your Rust project into the container
ADD . /source
WORKDIR /source

# Build the Rust project
RUN cargo build --release

# Expose the port used by your Rust project
EXPOSE 8080

# Start both the setup script and the Rust binary
CMD cargo run --release

