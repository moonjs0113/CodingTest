/*
  Uncommon Words from Two Sentences
  URL: https://leetcode.com/problems/uncommon-words-from-two-sentences
  Difficulty: Easy
  Topic: Hash Table, String, Counting
*/

class Solution {
    func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
        var dict:[String: Int] = [:]
        (s1 + " " + s2).components(separatedBy: " ").forEach {
            if let count = dict[$0] { dict[$0]! += 1 } 
            else { dict[$0] = 1 }
        }
        return dict.compactMap { return $0.value == 1 ? $0.key : nil }
    }
}
