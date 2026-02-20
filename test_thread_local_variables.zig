const std=@import("std");
const assert=std.debug.assert;
// Thead-local variable
// threadlocal measn: =  shared between all threads
// -each thread gets its own sepatate copy
// of this variable
// it is not shard between threads
threadlocal var x:i32=1234;
// test

test "thread local storage"{
    // Spawn thread 1
    // std.Thread.spawn(options,funciton,arguments)
    // .{} means default thread options
    // testTls is the fucniton the thread will run 
    // .{} means no argumenst apssed
    // 
const thread1=try std.Thread.spawn(.{}, testTls,.{});
// spawn thread 2

const thread2=try std.Thread.spawn(.{}, testTls,.{});
// Call testTls in the main thread
// so now we have:
// -main thread
// -Thread 1
// -Thread 2
// 
testTls();
// waits for both the threads to finis
thread1.join();
thread2.join();    
}
fn testTls() void{
    assert(x==1234);
    x+=1;
    assert(x==1235);
}