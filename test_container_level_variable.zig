var y: i32=add(10,x);
const x: i32=add(12,34);
// Container-Level Variables
// these variables are declared at file scope
// That means they are evaluated when the program
// is initialized(before tests run).
// x is constant.
// it is computed using the add(12,34).
// Since both arguments are known at compile time,
// the compiler evaluates this at compile time.
// 
// so x becomes 46.
// y is a mutable global variable.
// it uses x as an argument.
// 
// since x is already known (46),
// this becomes:
// 
// y=add(10,46)
// y=56
// 
// Test 
test "container level variable"{
    // check it x equals 46

    try expect(x==46);
    // check if y equals 56
    try expect(y==56);
}
// function
fn add(a: i32, b:i32) i32{
    return a+b;
}
const std=@import("std");
const expect =std.testing.expect;