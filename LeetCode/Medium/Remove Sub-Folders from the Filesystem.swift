/*
  Remove Sub-Folders from the Filesystem
  URL: https://leetcode.com/problems/remove-sub-folders-from-the-filesystem
  Difficulty: Medium
  Topic : Array, String, Depth-First Search, Trie
*/

class Solution {
    func removeSubfolders(_ folder: [String]) -> [String] {
        let f = folder.sorted()
        var result: [String] = []
        result.append(f.first!)
        for i in 1..<f.count {
            let last = "\(result.last!)/"
            if !f[i].hasPrefix(last) {
                result.append(f[i])
            }
        }
        return result
    }
}
