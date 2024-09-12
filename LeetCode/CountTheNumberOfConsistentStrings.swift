/*
  Count the Number of Consistent Strings
  URL: https://leetcode.com/problems/count-the-number-of-consistent-strings
  Difficulty: Easy
  Topic: Array, Hash Table, String, Bit Manipulation, Counting
*/

class Solution {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        let set = Set(allowed)
        return words.reduce(0) { Set($1).subtracting(set).count == 0 ? $0 + 1 : $0  }
    }
}
