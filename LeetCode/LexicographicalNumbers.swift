/*
  Lexicographical Numbers
  URL: https://leetcode.com/problems/lexicographical-numbers
  Difficulty: Medium
  Topic : Depth-First Search, Trie
*/

class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        (1...n).sorted { "\($0)" < "\($1)" }
    }
}
