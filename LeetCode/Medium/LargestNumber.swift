/*
  Largest Number
  URL: https://leetcode.com/problems/largest-number
  Difficulty: Medium
  Topic : Array, String, Greedy, Sorting
*/

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        Set(nums).count == 1 && Set(nums).contains(0)
        ? "0"
        : nums
        .sorted { "\($0)" + "\($1)" > "\($1)" + "\($0)" }
        .reduce("") { $0 + "\($1)" }
    }
}
