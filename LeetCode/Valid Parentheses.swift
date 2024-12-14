/*
  Valid Parentheses
  URL: https://leetcode.com/problems/valid-parentheses
  Difficulty: Easy
  Topic: Array, Stack
*/

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        var pair: [Character:Character] = [")":"(", "}":"{", "]":"["]
        for c in s {
            if c == "(" || c == "{" || c == "[" {
                stack.append(c)
            } else {
                guard let last = stack.last else {
                    return false
                }
                if let p = pair[c] {
                    if p == last {
                        _ = stack.removeLast()
                    } else {
                        return false
                    }
                }
            }
        }
        return stack.isEmpty
    }
}
