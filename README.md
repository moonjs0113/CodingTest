# CodingTest

- 10 ^ 8 (100,000,000) = 1s
- Tips
``` Swift
/*
  String <-> Int in Binary Format
*/
String(2, radix:2) // "10"
Int("10110110", radix: 2) // 182

/*
  String -> Character Array
*/
Array(String("ArrayString")) // ["A", "r", "r", "a", "y", "S", "t", "r", "i", "n", "g"]

/*
  String Initializer
*/
String(format: "%05d", Int("110") ?? 0) // "00110"
String(repeating: "1", count: 3) // "111"

/*
  String Slide
*/
"let separatedString = string".components(separatedBy: " ")
// ["let", "separatedString", "=", "string"] -> [String]

"let separatedString = string".split(separator: " ")
// ["let", "separatedString", "=", "string"] -> [String.SubSequence]

/*
  SubString
*/
String(Array("String")[i...j]) // 느리다.

/*
  Set vs Array Contains Function Time Complexity
*/
Set.contains(_:) // O(1) Because Set adopted Hashable protocol
Array.contains(_:) // O(n)

/*
  Square Root
*/
Int(sqrt(16)) // 4

/*
  Backjoon Input
*/
// Line 별로 readLine()! 호출
let input0 = readLine()!
let input1 = readLine()!

/*
  Stride
*/
// stride<T>(from start: T, to end: T, by stride: T.Stride)
stride(from: 0, to: 10, by: 2) // 0, 2, 4, 6, 8

/*
  Cache Table
*/
let cache: [Bool] = Array(repeating: false, count: n + 1)
let cache: [Int:Int] = [:]
```
