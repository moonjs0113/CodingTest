/*
  Minimum Add to Make Parentheses Valid
  URL: https://leetcode.com/problems/minimum-add-to-make-parentheses-valid
  Difficulty: Medium
  Topic : String, Stack, Greedy
*/

class Solution {
    func minAddToMakeValid(_ s: String) -> Int {
        var stack: [Character] = []
        s.forEach {
            if let value = stack.last, value == "(" && $0 == ")" {
                stack.popLast()
            } else {
                stack.append($0)
            }
        }
        return stack.count
    }
}
