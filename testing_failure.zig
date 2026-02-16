const std=@import("std");
// Test1 this will fail
test "expect this to fail"{
    // std.testing.expect(condition)
    // it check if the condition is true.
    // if condition==true->success(return void)
    // if condition==false->return error.TestUnexpectedResult;
    // trhy is used for getting the error
    // for solving this problem i think we used the skipped this test
    // we write the return error.skipzigtest to exist the fucniton instad of failing the test 
    // any code written after'return' never execute 
    return error.SkipZigTest;
    // try std.testing.expect(false);
  
}
test "expect this to succeed"{
    try std.testing.expect(true);
}