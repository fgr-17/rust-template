.PHONY: format lint test doc build cov

include coverage.mk

all: clean format lint test cov doc

clean: cclean

format:
	cargo fmt --all

lint:
	cargo clippy -- -D warnings

cclean:
	cargo clean

test:
	cargo test

doc:
	cargo doc

build:
	cargo build

run:
	cargo run
