"""
  Separate Black and White Balls
  URL: https://leetcode.com/problems/separate-black-and-white-balls
  Difficulty: Medium
  Topic: Two Pointers, String, Greedy
"""

class Solution {
    func minimumSteps(_ s: String) -> Int {
        s.reduce(into: [0,0]) { r, c in
            if c == "1" {
                r[1] += 1
            } else {
                r[0] += r[1]
            }
        }[0]
    }
}
