/*
  Construct String With Repeat Limit
  URL: https://leetcode.com/problems/construct-string-with-repeat-limit
  Difficulty: Medium
  Topic: Hash Table, String, Greedy, Heap (Priority Queue), Counting
*/

import Foundation

extension Int {
    var str: String {
        guard let unicode = UnicodeScalar(self + 97) else {
            return ""
        }
        return "\(Character(unicode))"
    }
}

class Solution {
    func repeatLimitedString(_ s: String, _ repeatLimit: Int) -> String {
        var freq = Array(repeating: 0, count: 26)
        for c in s {
            if let i8 = c.asciiValue {
                let i = Int(i8)
                freq[i - 97] += 1
            }
        }
        var result = ""
        var i = 25
        while i >= 0 {
            if freq[i] == 0 {
                i -= 1
                continue
            }
            let use = min(freq[i], repeatLimit)
            result.append(String(repeating: i.str, count: use))
            freq[i] -= use
            
            if freq[i] > 0 {
                var si = i - 1
                while si >= 0 && freq[si] == 0 {
                    si -= 1
                }
                if si < 0 { break }
                result.append(si.str)
                freq[si] -= 1
            }
        }
        return result
    }
}
