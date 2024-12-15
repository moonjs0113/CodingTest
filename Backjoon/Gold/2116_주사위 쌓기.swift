/*
 주사위 쌓기
 https://www.acmicpc.net/problem/2116
*/

let n = Int(readLine()!)!
var dices: [[Int]] = []
let opposite: [Int:Int] = [
    0:5, 1:3, 2:4,
    5:0, 3:1, 4:2
]
(0..<n).forEach { _ in
    dices.append(readLine()!.split(separator: " ").map { Int("\($0)")! })
}
var result = 10_001
for i in 1..<7 {
    var prev = i
    var temp = 0
    for d in dices {
        let next = d[opposite[d.firstIndex(of: prev)!]!]
        if (prev == 6 && next == 5) || (prev == 5 && next == 6) {
            temp += 2
        } else if prev == 6 || next == 6 {
            temp += 1
        }
        prev = next
        if temp > result + 2 { break }
    }
    result = min(temp, result)
    if result == 0 { break }
}
print((6 * n) - (n <= 1 ? 0 : result))
