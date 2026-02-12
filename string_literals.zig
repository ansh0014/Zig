const print = @import("std").debug.print;
// import print function

const mem = @import("std").mem; // will be used to compare bytes
// import memory utilities(used to compare byte slices)

pub fn main() void {
    // string in just bytes
    const bytes = "hello";
    print("{}\n", .{@TypeOf(bytes)}); // *const [5:0]u8
    print("{d}\n", .{bytes.len}); // 5  // .len gives number of bytes
    print("{c}\n", .{bytes[1]}); // 'e' // indexing
    // bytes[1] means: index[0]->h, index[1]->e 
    print("{d}\n", .{bytes[5]}); // 0
    // why 0 because in zig string literals are null-terminates
    // after "hello"->there is '\0'

    print("{}\n", .{'e' == '\x65'}); // true
    // 'e'=ASCII 101
    // '\x65'=hex 65=decimal 101
    // so they are equal

    print("{d}\n", .{'\u{1f4a9}'}); // 128169
    // unicode code points
    // unicode escape 
    // 1f4a9 is hex
    // decimal=128175

    print("{d}\n", .{'💯'}); // 128175
    // character literal
    // zig stores unicode characters as codepoints(u21)
    print("{u}\n", .{'⚡'});
    // {u} prints unicode character
    print("{}\n", .{mem.eql(u8, "hello", "h\x65llo")}); // true
    // byte comparison
    // "h\x64llo"
    // \x65='e'
    // so both strings are identical in bytes

    print("{}\n", .{mem.eql(u8, "💯", "\xf0\x9f\x92\xaf")}); // also true
    // unicode '100' in UTF-8 is:
    // f0 9f 92 af
    // same bytes->equal
    const invalid_utf8 = "\xff\xfe"; // non-UTF-8 strings are possible with \xNN notation.
    // zig does not enforce UTF-8 validitly.
    // strings are just byte arrays

    print("0x{x}\n", .{invalid_utf8[1]}); // indexing them returns individual bytes...
    // prints raw byte
    print("0x{x}\n", .{"💯"[1]}); // ...as does indexing part-way through non-ASCII characters
    // indexing unicode string returns raw byte
}
