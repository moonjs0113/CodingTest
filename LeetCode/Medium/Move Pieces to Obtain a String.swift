/*
  Move Pieces to Obtain a String
  URL: https://leetcode.com/problems/move-pieces-to-obtain-a-string
  Difficulty: Medium
  Topic : Two Pointers, String
*/

class Solution {
    func canChange(_ start: String, _ target: String) -> Bool {
        var s = start.enumerated().filter { $0.element != "_" }
        var t = target.enumerated().filter { $0.element != "_" }
        if s.count != t.count {
            return false
        }
        for i in 0..<s.count {
            let se = s[i].element
            if se != t[i].element {
                return false
            }
            let si = s[i].offset
            let ti = t[i].offset
            if (se == "L" ? si < ti : si > ti) {
                return false
            }
        }
        return true
    }
}
