/*
  Defuse the Bomb
  URL: https://leetcode.com/problems/defuse-the-bomb
  Difficulty: Easy
  Topic : Array, Sliding Window
*/

class Solution {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        var result = Array(repeating: 0, count: code.count)
        if k == 0 {
            return result
        }
        for i in 0..<code.count {
            var s = 0
            var e = 0
            if k > 0 {
                s = (i == code.count - 1) ? 0 : i + 1
                e = s + k - 1
                if e >= code.count { e -= code.count }
            } else {
                e = (i == 0) ? code.count - 1 : i - 1
                s = e + k + 1
                if s < 0 { s = code.count + s }
            }
            var value = 0
            if s <= e {
                value = code[s...e].reduce(into: 0) { $0 += $1 }
            } else {
                value = code[s...code.count-1].reduce(into: 0) { $0 += $1 } + code[0...e].reduce(into: 0) { $0 += $1 }
            }
            result[i] = value
        }
        return result
    }
}
