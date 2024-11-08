/*
  Maximum XOR for Each Query
  URL: https://leetcode.com/problems/maximum-xor-for-each-query
  Difficulty: Medium
  Topic : Array, Bit Manipulation, Prefix Sum
*/

class Solution {
    func getMaximumXor(_ nums: [Int], _ maximumBit: Int) -> [Int] {
        var r = [(1 << maximumBit) - 1]
        nums.forEach {
            let last = r.last!
            r.append(last ^ $0)
        }
        r = Array(r.reversed())
        r.popLast()
        return r
    }
}
