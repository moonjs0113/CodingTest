/*
  Find Longest Special Substring That Occurs Thrice I
  URL: https://leetcode.com/problems/find-longest-special-substring-that-occurs-thrice-i
  Difficulty: Medium
  Topic: Hash Table, String, Binary Search, Sliding Window, Counting
*/

import Foundation

class Solution {
    func maximumLength(_ s: String) -> Int {
        var cache: [String: Int] = [:]
        var countStrings = 0
        var s = Array(s).map(String.init)
        for i in 0..<s.count {
            let c = s[i]
            var len = 0
            for j in i..<s.count {
                if c == s[j] {
                    len += 1
                    cache["\(c)-\(len)"] = cache["\(c)-\(len)", default: 0] + 1
                } else {
                    break
                }
            }
        }
        var result = 0
        for v in cache {
            let len = Int(v.key.components(separatedBy: "-").last!)!
            if v.value >= 3 && len > result {
                result = len
            }
        }
        return (result == 0 ? -1 : result)
    }
}
