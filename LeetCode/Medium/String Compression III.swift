/*
  String Compression III
  URL: https://leetcode.com/problems/string-compression-iii
  Difficulty: Medium
  Topic : String
*/

class Solution {
    func compressedString(_ word: String) -> String {
        var charDict: [Character: Int] = [:]
        var cur: Character = word.first!
        var result = ""
        for c in "\(word) " {
            if c != cur || (charDict[c] ?? 0) == 9 {
                if charDict[cur]! != 0 {
                    result += "\(charDict[cur]!)\(cur)"
                }
                cur = c
                charDict[cur] = 0
            }
            charDict[c] = (charDict[c] ?? 0) + 1
        }
        return result
    }
}
