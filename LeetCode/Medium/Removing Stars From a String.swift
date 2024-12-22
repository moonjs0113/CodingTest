/*
  Removing Stars From a String
  URL: https://leetcode.com/problems/removing-stars-from-a-string
  Difficulty: Medium
  Topic : String, Stack, Simulation
*/

class Solution {
    func removeStars(_ s: String) -> String {
        s.reduce(into: "") { r, c in
            if c == "*" {
                r.popLast()
            } else {
                r.append(c)
            }
        }
    }
}
