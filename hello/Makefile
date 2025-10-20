.PHONY: format lint test doc build

all: format lint test doc build

format:
	cargo fmt --all

lint:
	cargo clippy -- -D warnings

test:
	cargo test

doc:
	cargo doc

build:
	cargo build

run:
	cargo run
