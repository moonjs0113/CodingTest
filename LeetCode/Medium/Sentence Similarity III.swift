/*
  Sentence Similarity III
  URL: https://leetcode.com/problems/sentence-similarity-iii
  Difficulty: Medium
  Topic : Array, Two Pointers, String
*/

class Solution {
    func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
        if sentence1 == sentence2 { return true }
        var s1 = sentence1.split(separator: " ").map(String.init)
        var s2 = sentence2.split(separator: " ").map(String.init)
        if s1.count == 1 {
            return (s2.prefix(1) == [sentence1] || s2.suffix(1) == [sentence1])
        }
        if s2.count == 1 {
            return (s1.prefix(1) == [sentence2] || s1.suffix(1) == [sentence2])
        }
        if s1.count > s2.count { swap(&s1, &s2) }

        for s1Index in 0...s1.count {
            if s1Index == 0 || s1Index == s1.count {
                print(s1.prefix(s2.count), s2)
                print(s1.suffix(s2.count), s2)
                if Array<String>(s2.prefix(s1.count)) == s1 || Array<String>(s2.suffix(s1.count)) == s1 {
                    return true
                }
            } else {
                if s1.prefix(s1Index) == s2.prefix(s1Index) && s1.suffix(s1.count-s1Index) == s2.suffix(s1.count-s1Index) {
                    return true
                }
            }
        }
        return false
    }
}
