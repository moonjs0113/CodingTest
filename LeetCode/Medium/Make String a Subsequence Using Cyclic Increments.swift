/*
  Make String a Subsequence Using Cyclic Increments
  URL: https://leetcode.com/problems/make-string-a-subsequence-using-cyclic-increments
  Difficulty: Medium
  Topic: Two Pointers, String
*/

class Solution {
    func canMakeSubsequence(_ str1: String, _ str2: String) -> Bool {
        let dict = [
            "a": "b", "b": "c", "c": "d", "d": "e", "e": "f",
            "f": "g", "g": "h", "h": "i", "i": "j", "j": "k",
            "k": "l", "l": "m", "m": "n", "n": "o", "o": "p",
            "p": "q", "q": "r", "r": "s", "s": "t", "t": "u",
            "u": "v", "v": "w", "w": "x", "x": "y", "y": "z",
            "z": "a"
        ]
        let arr1 = Array(str1).map(String.init)
        let iarr1 = arr1.compactMap { dict[$0] }
        let arr2 = Array(str2).map(String.init)
        var i = 0
        var j = 0
        while i < arr1.count {
            if arr1[i] == arr2[j] || iarr1[i] == arr2[j] {
                j += 1
            }
            if j >= arr2.count { return true }
            i += 1
        }
        return false
    }
}
