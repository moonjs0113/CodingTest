/*
  Minimum Number of Swaps to Make the String Balanced
  URL: https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-string-balanced
  Difficulty: Medium
  Topic: Two Pointers, String, Stack, Greedy
*/

class Solution {
    func minSwaps(_ s: String) -> Int {
        var stack: [String] = []
        s.forEach {
            if let value = stack.last, value == "[" && "\($0)" == "]" {
                stack.popLast()
            } else {
                stack.append("\($0)")
            }
        }
        return (stack.count / 2 + 1) / 2
    }
}
