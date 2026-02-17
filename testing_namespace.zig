// The Testing Namespace
//
// Zig's standard library provides a testing namespace:
//      std.testing
//
// It contains helper functions like:
// - expect()
// - expectEqual()
// - expectError()
// - etc.

const std = @import("std");


// TEST 1 → expectEqual Demo

test "expectEqual demo" {

    // Known expected value
    const expected: i32 = 44;

    // Actual result from some expression
    const actual = 44;

    // expectEqual(expected, actual)
    //
    // - First argument → expected value
    // - Second argument → actual value
    //
    // It checks if they are equal.
    //
    // If not equal → returns error
    // If equal → returns success (void)
    //
    // IMPORTANT:
    // If types are different,
    // Zig attempts to cast the actual value
    // to the type of expected.
    //
    try std.testing.expectEqual(expected, actual);
}

// TEST 2 → expectError Demo

test "expectError demo" {

    // Define expected error
    const expected_error = error.DemoError;

    // Define an error union value
    //
    // anyerror!void means:
    //   This can either be:
    //      - an error
    //      - or void (success)
    //
    const actual_error_union: anyerror!void = error.DemoError;

    // expectError(expected_error, actual_error_union)
    //
    // It checks:
    //   "Does this error union contain exactly the expected error?"
    //
    // If the error matches → success
    // If the error is different → test fails
    // If there is no error → test fails
    //
    try std.testing.expectError(expected_error, actual_error_union);
}
