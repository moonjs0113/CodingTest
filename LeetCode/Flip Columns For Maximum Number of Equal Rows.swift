/*
  Flip Columns For Maximum Number of Equal Rows
  URL: https://leetcode.com/problems/flip-columns-for-maximum-number-of-equal-rows
  Difficulty: Medium
  Topic : Array, Hash Table, Matrix
*/

class Solution {
    func maxEqualRowsAfterFlips(_ matrix: [[Int]]) -> Int {
        if matrix.first!.count == 1 { return matrix.count }
        var cache: [[Int]:Int] = [:]
        for m in matrix {
            var key: [Int] = []
            var temp = 0
            var prev = m.first!
            for i in 1..<m.count {
                if i % 63 == 62 {
                    key.append(temp)
                    temp = 0
                }
                if prev != m[i] {
                    temp += 1
                    prev = m[i]
                }
                temp = temp << 1
            }
            key.append(temp)
            cache[key, default: 0] += 1
        }
        return cache.values.max()!
    }
}
