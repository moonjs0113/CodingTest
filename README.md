# CodingTest

- 10 ^ 8 (100,000,000) = 1s

- String <-> Int in Binary Format
``` Swift
String(2, radix:2) // "10"
Int("10110110", radix: 2) // 182
```

- String -> Character Array
``` Swift
Array(String("ArrayString")) // ["A", "r", "r", "a", "y", "S", "t", "r", "i", "n", "g"]
```

- String Initializer
``` Swift
String(format: "%05d", Int("110") ?? 0) // "00110"
String(repeating: "1", count: 3) // "111"
```

- String Slide
``` Swift
"let separatedString = string".components(separatedBy: " ") // ["let", "separatedString", "=", "string"]
```

- SubString
``` Swift
String(Array("String")[i...j]) // 느리다.
```

- Set vs Array Contains Function Time Complexity
``` Swfit
Set.contains(_:) // O(1) Because Set adopted Hashable protocol
Array.contains(_:) // O(n)
```

- Square Root
``` Swift
Int(sqrt(16)) // 4
```

- Backjoon Input
``` Swift
// Line 별로 readLine()! 호출
let input0 = readLine()!
let input1 = readLine()!
```
