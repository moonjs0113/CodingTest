/*
  Check If a Word Occurs As a Prefix of Any Word in a Sentence
  URL: https://leetcode.com/problems/check-if-a-word-occurs-as-a-prefix-of-any-word-in-a-sentence
  Difficulty: Easy
  Topic : Two Pointers, String, String Matching
*/

import Foundation
class Solution {
    func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        for item in sentence.components(separatedBy: " ").enumerated() {
            if item.element.hasPrefix(searchWord) {
                return item.offset + 1
            }
        }
        return -1
    }
}
