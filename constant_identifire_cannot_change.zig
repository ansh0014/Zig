const x= 1234;
// const means: the value is known at known at compile-time or assigned once and can never change.
fn foo() void{
    // IT WORKS AT FILE SCOPE AS WELL AS INSIDE FUCNITONS
    const y=5678;  // y is the immutable. Do not allow any modification
// once assigned, an identifier cannot be changed
x+=2;
y+=1;  
// in above two line we will try to change the value but it give error 
// zig is designed to:
// Avoid runtime surprises
// be explicit
// catch error at compile time 
var k=9898;
k+=1;
// const=immutable
// var= mutable
}
pub fn main() void {
    foo();
}