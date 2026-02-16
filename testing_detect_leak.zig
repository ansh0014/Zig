const std=@import("std");
test "detect leak"{
    // create an Arraylist of type u21(unicode scalar value).
    // Arraylist is dynamic array.
    // it uses heap memory internally.
    // init(std.testing.allocator) means;
    // "use the special testing allocator"
    // ===================================
    // std.testing.allocator:
    // -Tracks all allocations.
    // -At the end of test,
    // it checks wheter everything was freed.

   var list=std.ArrayList(u21).init(std.testing.allocator);
    //    their is one problem in our code
    // we for got tor write the 
    // defer list.define();
    // this means allocated memory will not be freed(asking for memory in the heap).
    // append()adds an element to the dynamic array.
    // since the list is empty.
    // it must allocate heap memor to store the eleement
    // so internally:
    // allocator.alloc(...) is called.
    // memory is now allocated on the heap.
  
    // missing 'defer list.deint();'
     try list.append('☔');
    //  check that length is 1.
    // /this part works fine.

     try std.testing.expect(list.items.len==1);
    //  test ends here.
    // now std.testing.allocator checks:
    // "is there any allocated memory that was not freed?"
    // yes->the ArrayList allocated memory.
    // no deinit() was called.
    // so the testing allocator reports
    // MEMORY LEAK DETECTED
}