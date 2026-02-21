const std =@import("std");
const expect =std.testing.expect;
test "CompTime variables"{
    // Normal runtime variables.
    // Stored on stack.
    // value decided at runtime.
// comptime means:
// This must be known and executed during compliation
// var x: i32=1;
// exists in memory at runtime.
// stored on stack
// Modified while program runs.
    var x: i32 =1;
    // comptime variable.
    // This variable exists ony during compilation.
    // it does not exist at runtime.
    // exists only while compiling
    // Not stored in runtime memory.
   // value decide before program runs
//  steps during Compilation
// 1) comptime var y=1
// 2) y+=1--> y becomes 2
// 3) if(y!=2)---> evaluated immediately
// 4) Condition is false
// 5) Compiler removes entire if block
// 6) @compilerError never runs
    comptime var y: i32=1;
    // runtime increment.
    
    x+=1;
    // Compile-time increment.
    // this happens during compilation
    y+=1;
    // Runtime check
    try expect(x==2);
    // y is known at compile time,
    // but can still be used in runtime expression
    try expect(y==2);
    // since y is comptime,
    // this condition is evaluated at compile time.
    if(y!=2){
        // This compile error never triggers because y is a comptime variable,
        // and so 'y!=2' is a comptime value, and this if is statically evaluated.

  @compileError("wrong y value");
    }
    
}