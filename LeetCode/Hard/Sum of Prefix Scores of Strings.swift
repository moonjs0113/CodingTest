/*
  Sum of Prefix Scores of Strings
  URL: https://leetcode.com/problems/sum-of-prefix-scores-of-strings
  Difficulty: Hard
  Topic: Array, String, Trie, Counting
*/

class Solution {
    func sumPrefixScores(_ words: [String]) -> [Int] {
        var cache: [String: Int] = [:]
        return words.map { word in
            if let cacheValue = cache[word] { return cacheValue }
            var prefix = ""
            var prefixCache = words.filter { $0 != word }
            var count = word.count * (words.count - prefixCache.count)
            for c in Array(word) {
                prefix += "\(c)"
                var prefixCount = 0
                prefixCache = prefixCache.compactMap { w -> String? in
                    if w.hasPrefix(prefix) {
                        prefixCount += 1
                        return w
                    } else {
                        return nil
                    }
                }
                count += prefixCount
                if prefixCache.isEmpty { break }
            }
            cache[word] = count
            return count
        }
    }
}
