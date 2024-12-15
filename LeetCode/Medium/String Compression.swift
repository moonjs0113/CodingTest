/*
  String Compression
  URL: https://leetcode.com/problems/string-compression
  Difficulty: Medium
  Topic: Two Pointers, String
*/

class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        var c: Character = chars.first!
        var count = 0
        chars = (chars + [" "]).flatMap { char in
            if c != char {
                let t = [c] + (count > 1 ? Array("\(count)") : [])
                c = char
                count = 1
                return t
            }
            count += 1
            return []
        }
        return chars.count
    }
}
