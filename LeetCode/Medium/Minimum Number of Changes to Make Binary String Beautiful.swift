/*
  Minimum Number of Changes to Make Binary String Beautiful
  URL: https://leetcode.com/problems/minimum-number-of-changes-to-make-binary-string-beautiful
  Difficulty: Medium
  Topic : String
*/

class Solution {
    func minChanges(_ s: String) -> Int {
        var count = 0
        var char: Character = (s.first! == "1" ? "0" : "1")
        var subCount = 0
        for c in s {
            if c != char {
                if subCount % 2 == 0 {
                    char = c
                    subCount = 1
                } else { 
                    count += 1
                    char = (c == "1" ? "0" : "1")
                    subCount = 0
                }
            } else {
                subCount += 1
            }
        }
        return count
    }
}
