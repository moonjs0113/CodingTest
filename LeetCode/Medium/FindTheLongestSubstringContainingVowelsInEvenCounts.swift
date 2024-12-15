/*
  Find the Longest Substring Containing Vowels in Even Counts
  URL: https://leetcode.com/problems/find-the-longest-substring-containing-vowels-in-even-counts
  Difficulty: Medium
  Topic : Hash Table, String, Bit Manipulation, Prefix Sum
*/

class Solution {
    func findTheLongestSubstring(_ s: String) -> Int {
        let vowels = Set(["a", "e", "i", "o", "u"])
        if Set(s.map{"\($0)"}).intersection(vowels).count == 0 { print(s.count) }

        var bitDict: [Int: Int] = [0: -1]
        var result = 0
        var bit = 0

        for item in s.enumerated() {
            if item.element == "a" { bit ^= 1 }
            else if item.element == "e" { bit ^= 2 }
            else if item.element == "i" { bit ^= 4 }
            else if item.element == "o" { bit ^= 8 }
            else if item.element == "u" { bit ^= 16 }

            if let prev = bitDict[bit] { result = max(result, item.offset-prev) }
            else { bitDict[bit] = item.offset }
        }
        return result
    }
}
