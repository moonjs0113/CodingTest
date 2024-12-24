/*
  Minimum Remove to Make Valid Parentheses
  URL: https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses
  Difficulty: Medium
  Topic: String, Stack
*/

class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack: [Int] = []
        var result = Array(s).map(String.init)
        for (i, c) in s.enumerated() {
            if c == "(" {
                stack.append(i)
            } else if c == ")" {
                if stack.isEmpty {
                    result[i] = ""
                } else {
                    _ = stack.popLast()
                }
            }
        }
        
        for i in stack {
            result[i] = ""
        }
        return result.reduce(into: "") { r, c in r.append(c) }
    }
}
