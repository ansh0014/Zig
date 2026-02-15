const print =@import("std").debug.print;
pub fn main()void{
    var x:i32=undefined;
    x=1;
    print("{d}",.{x});
    // var->mutable variable(can change value)
    // x->variable name 
    // :i32->explicit type annotation(signed 32-bit integer)
    // =undefined->memory is allocated but not initialized
    // undefined means the value is garbage until assigned
    // x=1;   Assigning value 1 to x

}