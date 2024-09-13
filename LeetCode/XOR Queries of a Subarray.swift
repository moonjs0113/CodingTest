/*
  XOR Queries of a Subarray
  URL: https://leetcode.com/problems/count-the-number-of-consistent-strings
  Difficulty: Medium
  Topic: Array, Bit Manipulation, Prefix Sum
*/

class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        queries.map { arr[$0[0]...$0[1]].reduce(0) { $0 ^ $1 } }
    }
}
