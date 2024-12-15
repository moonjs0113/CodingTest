/*
  주사위 윷놀이
  https://www.acmicpc.net/problem/17825
*/

var dice = readLine()!
    .split(separator: " ")
    .compactMap(String.init)
    .compactMap(Int.init)
let scross: [Int: Int] = [5: 21, 10: 24, 15: 26]
var point: [Int] = [
    0, 2, 4, 6, 8, 10, 12, 14, 16, 18, // 9
    20, 22, 24, 26, 28, 30, 32, 34, 36, 38, // 19
    40, 13, 16, 19, 22, 24, 28, 27, 26, 25, // 29
    30, 35, 0
]
var destinations: [Int] = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, // 9
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20, // 19
    32, 22, 23, 29, 25, 29, 27, 28, 29, 30, // 29
    31, 20, 32
]
var dicePos: [Int] = [0, 0, 0, 0]

var result = 0
func dfs(t: Int, sum: Int) {
    if t == 10 {
        result = max(result, sum)
        return
    }
    for j in 0..<dicePos.count {
        var s = dicePos[j]
        var c = destinations[s]
        if let cross = scross[s] {
            c = cross
        }
        for _ in 1..<dice[t] {
            c = destinations[c]
        }
        if c == 32 || !dicePos.contains(c) {
            dicePos[j] = c
            dfs(t: t + 1, sum: sum + point[c])
            dicePos[j] = s
        }
    }
}
dfs(t: 0, sum: 0)
print(result)
