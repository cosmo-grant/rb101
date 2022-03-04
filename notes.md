# NOTES ON RB101

1.

```
if false
  greeting = "hello world"
end
greeting # => nil
```

Initial explanation: during parse-time Ruby scans the code and initializes to nil any local variable that's assigned to, even if that assignment will never be executed.

But that's not quite right:

```
greeting # => NameError
if false
  greeting = "hello world"
end
```

Better explanation: during parse-time Ruby scans the code and initializes to nil any local variable that's assigned to, even if that assignment will never be executed, *but that variable is only available in that scope and after the assignment*.

2. To iterate over a hash, you can use Hash#each, but also Hash#each_key or Hash#each_value.

3. The threequals method on ranges tests inclusion. Useful for writing case statements.