const std=@import("std");
const expect =std.testing.expect;
// Test
test "namespaced container level variable"{
    // First call;
    // S.x starts at 1234
    // foo() increments it-> 1235
    
    try expect(foo()==1235);
    // Second call;
    // S.x is now 1235
    // foo() increaments it->1236
    try expect(foo()==1236);
}
// ====STRUCT DEFINATION===

const S=struct {
    // This is a container-level variable INSIDE the struct.
    // 
    // It is shared.
    // It is NOT Tried to any instance.
    // Since we never create an instance of S,
    // This behaves like a static variable.

    var x: i32=1234;

};
// Function

fn foo() i32 {
    // Access strcut namespace:
    // S.x means:
    // "The variable x inside struct S"
    // This increment x by 1.
    
    S.x +=1;
    return S.x;
}
// Struct in Zig is a container of declaration.
// It can act as:
// -A data Strcutre
// -A namespace
// -A type
// Variable declared inside struct but outside funcitons
// Belong to the type (shared state)