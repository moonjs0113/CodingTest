/*
  Rotate String
  URL: https://leetcode.com/problems/rotate-string
  Difficulty: Easy
  Topic : String, String Matching
*/

class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        if s == goal { return true }
        if s.count != goal.count || Set(s) != Set(goal) { return false }
        var temp = s
        for _ in 0..<s.count {
            let c = temp.popLast()!
            temp = "\(c)" + temp
            if temp == goal {
                return true
            }
        }
        return false
    }
}
