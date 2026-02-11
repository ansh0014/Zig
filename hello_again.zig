// most of time ,it is more appropriate to write to stderr rater than stdout and whether or not the message is successfully written to the stream is irrelevant. For this common case there is a  simpler api
const std=@import("std");
pub fn main() void{
    std.debug.print("Hello, world!\n",.{});
}