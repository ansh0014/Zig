// Top-level declarations are order-independent:
// That means you can declare things in any order
// The compiler does not require forward declarations like c.
// Create short aliases for commonly used things
const print = std.debug.print;  // function to print formatted output
const std = @import("std");  // import zig standard library
const os = std.os; //os related utilites
const assert = std.debug.assert; // used for runtie checks
pub fn main() void {
    // integers
    // i32=signed 32-bit integer
    const one_plus_one: i32 = 1 + 1;
    //{}is placeholder for default formatting
    print("1+1={}\n", .{one_plus_one});
    // floats
    // f32=32-bit floating point number

    const seven_div_three: f32 = 7.0 / 3.0;
    print("7.0/3.0={}\n", .{seven_div_three});
    // boolean
    // and - &&
    // or - ||
    // !-not
    print("{}\n{}\n{}", .{
        true and false,  // false
        true or false,  // true
        !true,  // false
    });
    // optional
    // ?[]const u8 means:
    // optional slice of constant unsigned 8-bit intergers
    // (which is basically a string in zig)
// optional means:
// this is variable may contain a vlaue or it may contain nothing
// in zig noting is written as [null] and optional type is written [?T] ?-maybe
// exmaple var x:i32=5;, x must always contain a number , it can never abe empty
// var x:?i32=null, x can be null , or it can be number

    var optional_values: ?[]const u8 = null;
    // Type=?[]const u8
    // This means->optional string
    // curret value = null
    // assert ensures value is null
    // in memory looks like
    // optional_values=null
    assert(optional_values == null);
    // this program check is optional_values null
    // if yes->continues , otherwise program crashes
    print("\nopitonal 1\ntype:{}\nvalues:{?s}\n", .{
        @TypeOf(optional_values), optional_values,
    });
    //  @TypeOf(optional_values), optional_values,
    // ?[]cost u8 // print the optional string
    // this print optional 1 type"?[]const u8 values:null
    optional_values = "hi";
    // not memory changes to optional_values=hi 
    assert(optional_values != null);
    // now check again it is null or not 
    print("\noptional 2\ntype:{}\nvalue{?s}\n", .{
        @TypeOf(optional_values), optional_values,
    });
    // optional 2, type?[]const u8, valuehi
    // Error union
    // error union means (error!T)->value OR error
    // anyerror!i32 
    // This means the variable can store "an error , or an integer"
    // below line store the error.ArgNotFound;
    var number_or_error: anyerror!i32 = error.ArgNotFound;
    print("\nerror union1\ntype: {}\nvalue:{!}\n", .{
        @TypeOf(number_or_error), number_or_error,
    });
    // output
    // error uinon1
    // type:anyerror!i32
    // value:error.ArgNotFound
    number_or_error = 1234;
    // now the memory becomes number_or_error=1234

    print("\nerror union2\ntype:{}\nvalue:{!}\n", .{
        @TypeOf(number_or_error), number_or_error,
    });
    // error union2
    // type:anyerror!i32
    // value:1234
}
