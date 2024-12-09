/*
  Special Array II
  URL: https://leetcode.com/problems/special-array-ii
  Difficulty: Medium
  Topic: Array, Binary Search, Prefix Sum
*/

class Solution {
    func isArraySpecial(_ nums: [Int], _ queries: [[Int]]) -> [Bool] {
        var prefix = Array(repeating: 0, count: nums.count)
        for i in 1..<nums.count {
            prefix[i] = prefix[i-1] + ((nums[i] % 2 == nums[i-1] % 2) ? 1 : 0)
        }
        return (0..<queries.count).map { i in
            return (prefix[queries[i][1]] - prefix[queries[i][0]] == 0)
        }
    }
}
