# CodingTest

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

- Square Root
``` Swift
Int(sqrt(16)) // 4
```
