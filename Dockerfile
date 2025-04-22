# Build stage
FROM rust:1.77 AS builder

WORKDIR /app
COPY . .

# Build the release version of the binary
RUN cargo build --release

# Runtime stage
FROM rust:1.77

# Copy the built binary from the builder stage
COPY --from=builder /app/target/release/rust_ci_cd /usr/local/bin/rust_ci_cd

# Define default command
ENTRYPOINT ["rust_ci_cd"]
