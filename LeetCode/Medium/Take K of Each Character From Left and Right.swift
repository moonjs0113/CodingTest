/*
  Take K of Each Character From Left and Right
  URL: https://leetcode.com/problems/take-k-of-each-character-from-left-and-right
  Difficulty: Medium
  Topic : Hash Table, String, Sliding Window
*/

class Solution {
    func takeCharacters(_ s: String, _ k: Int) -> Int {
        if k == 0 { return 0 }
        let array = Array(s)
        let len = array.count
        var cache: [Character:Int] = ["a":0, "b":0, "c":0]
        for c in array {
            cache[c, default: 0] += 1
        }
        for item in cache {
            if item.value < k {
                return -1
            }
        }
        var window: [Character:Int] = ["a":0, "b":0, "c":0]
        var l = 0
        var result = 0

        for r in 0..<len {
            window[array[r], default: 0] += 1
            while (l <= r) && (cache["a"]! - window["a"]! < k || cache["b"]! - window["b"]! < k || cache["c"]! - window["c"]! < k) {
                window[array[l]]! -= 1
                l += 1
            }
            result = max(result, r - l + 1)
        }
        return len - result
    }
}
