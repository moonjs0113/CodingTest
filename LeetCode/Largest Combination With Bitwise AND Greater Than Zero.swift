/*
  Largest Combination With Bitwise AND Greater Than Zero
  URL: https://leetcode.com/problems/largest-combination-with-bitwise-and-greater-than-zero
  Difficulty: Medium
  Topic : Array, Hash Table, Bit Manipulation, Counting
*/

class Solution {
    func largestCombination(_ candidates: [Int]) -> Int {
        var maxLength = 0
        let binaryString = candidates.map {
            let binary = String($0, radix:2)
            maxLength = max(maxLength, binary.count)
            return Array(binary.reversed())
        }
        return (0..<maxLength).reduce(into: 0) { r, i in
            r = max(r, binaryString.reduce(0) { $0 + ($1.count > i && $1[i] == "1" ? 1 : 0) })
        }
    }
}
