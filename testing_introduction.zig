const std=@import("std");
// ===Test Block====
// test is special zig keyword-> It defines a test case that run only when you excute
// to run test case in zig use the zig test filename.zig
// it does not run in normal executable mode.
// the string after 'test' is jsut the test name.
// .it is used only for display in the test name.

test "expect addOne adds one to 41"{
    // std.testing.expect(condition)
    // -take a boolean expression
    // -if conditon==true->test passes.
    // -if condition==false->returns as error.
    // Important
    // expect() returns a error union tye:!void
    // that means:
    // that means:
    //  it returns either:
            // success(void)
            // or 
            // an error.
//  becasue it can return an error,
// zig forces us to handle it 
    // the standard library contains useful fucnitons to help create test.
    // 'expect' is a function that verifies its argument is true
    // it will return a error if its argument is false to indicate a failure.
    // 'try ' is used to return an error to the test runner to notify it that the test failed

    try std.testing.expect(addOne(41)==42);
    // 1) addOne(41)->return 42
    // 2) 42==42->true
    //3) expect(true)->success
    // 4) try sees not error->continues

}
// second test (identifier style)
// instead of a string, you can also use
// an identifier as the test name.
test addOne{
    // this test does the same check.
    // it exists to demostrate that both
    // naming styles are valid.
    // 
    // A test name can also be written using an identifier.
    // this is doctest , and serves as documentation for 'addOne'.
    try std.testing.expect(addOne(41)==42);
}
/// the function 'addOne' adds one to the number given as its argument.
/// this is the normal fuction
/// it is not special jsu because it's tested
fn addOne(number: i32) i32 {
    // number: i32->parameter type
    // i32->return type
    // zig requires explicit return types.
    // 
    
return number+1;
}