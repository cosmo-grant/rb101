1. Returns [ 1, 2, 3 ], because the block's return value for every element of the array is 'hi', which is truthy.

2. Returns 2. From the Array#count docs: if a block is given, counts the number of elements for which the block returns a true value.

3. Returns [ 1, 2, 3 ]. From the Array#reject docs: returns a new array containing the items in self for which the given block is not true. The block returns nil (the return value of the *puts* call) for every element.

4. Returns { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }. From the Enumerable#each_with_object docs: iterates the given block for each element with an arbitrary object given, and returns the initially given object. In this case, it returns the initially given hash, to which we've added the key-value pairs above in turn.

5. Returns [ :a, 'ant' ], having mutated the origina hash. From the Hash#shift docs: removes a key-value pair (implied to be the first) from the hash and returns it as the two-item array [ key, value ].

6. 11. Array#pop removes and returns the last item in the array, here 'caterpillar', which has length 11.

7. The block returns the value of its last evaluated expression, here the call to the even? method. It returns true when 1 is yielded to it. (I guess the any? method then terminates, rather than pointlessly continuing to iterate through each element of the array? The docs don't make this clear. But running the snippet confirms it.) The any? method returns true, because it returns true if ever the block returns a truthy value.

8. Array#take returns the given number of items from the array as an array, so here [ 1, 2 ]. The docs don't make completely clear whether it's in-place, but suggest not. That's confirmed by checking the value of arr after calling the method.

9. Returns [ nil, 'bear' ]. Hash#map returns a new array, containing the block's return values when each key-value pair in the hash is passed to it in turn. The block returns nil when the value has size <= 3, and the value otherwise, because an if statement evaluates to the value of its last evaluated expression or else nil.

10. Returns [ 1, nil, nil ]. Array#map returns a new array, containing the block's return values when each item in the array is passed to it in turn. The block returns 1 given 1, and nil given 2 and given 3, for the reason give above.