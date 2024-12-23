/*
  Count Binary Substrings
  URL: https://leetcode.com/problems/count-binary-substrings
  Difficulty: Easy
  Topic : Two Pointers, String
*/

class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        let s = (s + " ")
        var last: Character = (s.first! == "0" ? "1" : "0")
        var z = 0
        var o = 0
        var result = 0
        for c in s {
            if c != last {
                result += min(z, o)
                if last == "1" {
                    z = 1
                } else {
                    o = 1
                }
                last = c
            } else {
                if c == "0" {
                    z += 1
                } else {
                    o += 1
                }
            }
        }
        return result
    }
}
