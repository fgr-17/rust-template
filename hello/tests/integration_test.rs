// tests/integration_test.rs
use std::process::Command;

#[test]
fn test_main_output() {
    let output = Command::new("cargo")
        .args(&["run", "--quiet"])
        .output()
        .expect("Failed to run binary");

    let stdout = String::from_utf8_lossy(&output.stdout);
    assert!(stdout.contains("sum: 10 + 5 = 15"));
    assert!(stdout.contains("acc: 6"));
}
