/*
  Extra Characters in a String
  URL: https://leetcode.com/problems/extra-characters-in-a-string
  Difficulty: Medium
  Topic : Array, Hash Table, String, Dynamic Programming, Trie
*/

class Solution {
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var isLeafNode: Bool = false
    }
    
    func minExtraChar(_ s: String, _ dictionary: [String]) -> Int {
        var sArray = Array(s)
        let root = TrieNode()
        dictionary.forEach { word in
            var node = root
            var prefix = ""
            for char in word {
                if node.children[char] == nil {
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
            }
            node.isLeafNode = true
        }
        var cache: [Int?] = Array(repeating: nil, count: sArray.count + 1)
        cache[sArray.count] = 0
        
        func search(_ index: Int) -> Int {
            if let cache = cache[index] { return cache }
            var extra = 1 + search(index + 1)
            
            var current = root
            for j in index..<sArray.count {
                if let next = current.children[sArray[j]] {
                    current = next
                    if current.isLeafNode {
                        extra = min(extra, search(j + 1))
                    }
                } else {
                    break
                }
            }
            cache[index] = extra
            return extra
        }
        
        return search(0)
    }
}
