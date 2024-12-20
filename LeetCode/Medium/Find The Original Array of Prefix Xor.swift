/*
  Find The Original Array of Prefix Xor
  URL: https://leetcode.com/problems/find-the-original-array-of-prefix-xor
  Difficulty: Medium
  Topic: Array, Bit Manipulation
*/

class Solution {
    func findArray(_ pref: [Int]) -> [Int] {
        var dp = 0
        return pref.map { p in
            let next = dp ^ p
            dp ^= next
            return next
        }
    }
}
