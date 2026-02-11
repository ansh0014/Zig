const std = @import("std");
// Import zig standard library

// main is the entry point of the program
// !void means: this function can return a error ror return nothing

pub fn main() !void {
    // get standard output (terminal output stream)\
    // 
    const stdout = std.io.getStdOut().writer();
    // try means:
    // if printing fails , return the error imediately
    // zig does not use exceptions-error are explicit
// try =return error if print fails
    try stdout.print( 
        "Hello, {s}!\n", // {s} is sring placeholder
         .{"world"});   // .{} tuple of arguments passed to format
}