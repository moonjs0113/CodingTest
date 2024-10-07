/*
  Minimum String Length After Removing Substrings
  URL: https://leetcode.com/problems/minimum-string-length-after-removing-substrings
  Difficulty: Easy
  Topic : String, Stack, Simulation
*/

class Solution {
    func minLength(_ s: String) -> Int {
        var result: [String] = []
        for c in s {
            if let last = result.last, last == "A" && "\(c)" == "B" || last == "C" && "\(c)" == "D" {
                result.removeLast()
            } else {
                result.append("\(c)")
            }
        }
        return result.count
    }
}
