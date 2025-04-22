# Build stage
FROM rust:1.77 AS builder

WORKDIR /app
COPY . .

# Build the release version of the binary
RUN cargo build --release

# Runtime stage
FROM debian:bullseye-slim

# Copy the built binary from the builder stage
COPY --from=builder /app/target/release/add_cli /usr/local/bin/add_cli

# Define default command
ENTRYPOINT ["rust_ci_cd"]
