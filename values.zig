// Top-level declarations are order-independent:
const print = std.debug.print;
const std = @import("std");
const os = std.os;
const assert = std.debug.assert;
pub fn main() void {
    // integers
    const one_plus_one: i32 = 1 + 1;
    print("1+1={}\n", .{one_plus_one});
    // floats
    const seven_div_three: f32 = 7.0 / 3.0;
    print("7.0/3.0={}\n", .{seven_div_three});
    // boolean
    print("{}\n{}\n{}", .{
        true and false,
        true or false,
        !true,
    });
    // optional
    var optional_values: ?[]const u8 = null;
    assert(optional_values == null);
    print("\nopitonal 1\ntype:{}\nvalues:{?s}\n", .{
        @TypeOf(optional_values), optional_values,
    });
    optional_values = "hi";
    assert(optional_values != null);
    print("\noptional 2\ntype:{}\nvalue{?s}\n", .{
        @TypeOf(optional_values), optional_values,
    });
    // Error union
    var number_or_error: anyerror!i32 = error.ArgNotFound;
    print("\nerror union1\ntype: {}\nvalue:{!}\n", .{
        @TypeOf(number_or_error), number_or_error,
    });
    number_or_error = 1234;
    print("\nerror union2\ntype:{}\nvalue:{!}\n", .{
        @TypeOf(number_or_error), number_or_error,
    });
}
