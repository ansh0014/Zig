const std=@import("std");
// Import zig's builtin module
// This is not the standard library.

// It gives access to compiler-provided infromation.

const builtin =@import("builtin");
// create a shorter alias for std.testing.expext
// now i am talking about the 'builtin'
// it give access to:
// -target os
// -CPU archticture
// -optimization mode
// -wheter running in test mode
// -many compiler-level settings

const expect=std.testing.expect;
// Test Block
test "builtin.is_test"{
    // isAtleas() returnns a bool.
    // expect() checks if ththe value is true.
    // If isAtest()==true->testpasses
    // If isAtest()==false-> test fails
    // builtin.is_test is a compile-time boolean.
    // it is true when using 'zig test'.
    // it is false when using 'zig build-exe'.
    // it allows code to detect if it is running in test mode.
//     pub const builtin = struct {
//     pub const is_test: bool = ???;
//     pub const os: Os;
//     pub const cpu: Cpu;
//     pub const mode: Mode;
//     ...
// };


    try expect(isAtest());

}
// function

fn isAtest() bool{
    // builtin.is_test is compile-time constant.
    // it si true when the program is compiled using
    // zig test
    // 
    // it is false when compiled using
    // zig build-exe;

    return builtin.is_test;
}
