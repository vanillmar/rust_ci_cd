use clap::Parser;
use rust_ci_cd::add;

/// Simple CLI to add two integers
#[derive(Parser)]
#[command(name = "Add CLI", version, about = "Adds two integers", long_about = None)]
struct Args {
    /// First integer
    a: i32,
    /// Second integer
    b: i32,
}

fn main() {
    let args = Args::parse();
    let result = add(args.a, args.b);
    println!("Result: {}", result);
}
