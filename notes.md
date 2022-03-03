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