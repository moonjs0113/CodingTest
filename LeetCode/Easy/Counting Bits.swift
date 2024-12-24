/*
  Counting Bits
  URL: https://leetcode.com/problems/counting-bits
  Difficulty: Easy
  Topic : Dynamic Programming, Bit Manipulation
*/

class Solution {
    func countBits(_ n: Int) -> [Int] {
        var result = [0,1]
        if n == 0 { return [result[0]] }
        if n == 1 { return result }
        var i = 0
        var p = 2
        while result.count <= n {
            result.append(result[i] + 1)
            i += 1
            if i == p {
                p *= 2
                i = 0
            }
        }
        return result
    }
}
