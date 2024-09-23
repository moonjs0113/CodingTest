/*
  Longest Common Prefix
  URL: https://leetcode.com/problems/longest-common-prefix
  Difficulty: Easy
  Topic : String, Trie
*/

class Solution {
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var prefix: String
        
        init(prefix: String = "") {
            self.prefix = prefix
        }
    }

    func longestCommonPrefix(_ strs: [String]) -> String {
        let trie = TrieNode()
        var result = strs.first!
        for i in (0..<strs.count) {
            var node = trie
            var prefix = ""
            if strs[i] == "" { return "" }
            for char in strs[i] {
                if node.children[char] == nil { 
                    if i == 0 { node.children[char] = TrieNode(prefix: prefix) }
                    else { break } 
                }
                prefix += "\(char)"
                node = node.children[char]!
            }
            result = prefix.count < result.count ? prefix : result
        }
        return result
    }
}
