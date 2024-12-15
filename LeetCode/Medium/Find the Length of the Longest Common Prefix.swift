/*
  Find the Length of the Longest Common Prefix
  URL: https://leetcode.com/problems/find-the-length-of-the-longest-common-prefix
  Difficulty: Medium
  Topic : Array, Hash Table, String, Trie
*/

class Solution {
    func longestCommonPrefix(_ arr1: [Int], _ arr2: [Int]) -> Int {
        let root = TrieNode()
        var result = 0
        Set(arr1).forEach { insert(word: "\($0)", root) }
        Set(arr2).forEach { result = max(result, wordSearch(word: "\($0)", root)) }
        return result
    }
}

extension Solution {
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var isLeafNode: Bool = false
    }

    func insert(word: String, _ root: TrieNode) {
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

    func wordSearch(word: String, _ root: TrieNode) -> Int {
        var node = root
        var count = 0
        for char in word {
            guard let nextNode = node.children[char] else {
                return count
            }
            count += 1
            node = nextNode
        }
        return count
    }
}
