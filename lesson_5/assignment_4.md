# Example 3

| **line** | **action**          | **object**                            | **side effect**               | **return value**                     | **is return value used?**  |
|----------|---------------------|---------------------------------------|-------------------------------|--------------------------------------|----------------------------|
| 1        | method call (map)   | the outer array                       | none                          | a new array                          | no                         |
| 1-3      | block execution     | each sub-array                        | none                          | element at index 0 of each sub-array | yes, used by map           |
| 2        | method call (first) | each sub-array                        | none                          | element at index 0 of each sub-array | yes, argument to puts      |
| 2        | method call (puts)  | element at index 0 of each sub-array  | outputs string representation | nil                                  | no                         |
| 3        | method call (first) | each sub-array                        | none                          | element at index 0 of each sub-array | yes, return value of block |

# Example 4

Outputs 18, 7, 12.

The outer each method, as usual, returns the receiver, i.e. the original array, which is assigned to my_arr. The return value of the assignment operation itself is that same array.

# Example 5

Returns [[2, 4], [6, 8]], a new array.

# Example 6

If we used any? instead of all?, the code would return an array containing both hashes.

