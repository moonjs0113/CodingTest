/*
  Longest Subarray With Maximum Bitwise AND
  URL: https://leetcode.com/problems/longest-subarray-with-maximum-bitwise-and
  Difficulty: Easy
  Topic: Array, Bit Manipulation, Brainteaser
*/

class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        let maxNum = nums.max()!
        let result = nums.reduce((0,0)) {
            if $1 == maxNum { return ($0.0, $0.1 + 1)}
            else { return (max($0.0, $0.1), 0) }
        }
        return max(result.0, result.1)
    }
}
