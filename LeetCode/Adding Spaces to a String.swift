/*
  Adding Spaces to a String
  URL: https://leetcode.com/problems/adding-spaces-to-a-string
  Difficulty: Medium
  Topic: Array, Two Pointers, String, Simulation
*/

class Solution {
    func addSpaces(_ s: String, _ spaces: [Int]) -> String {
        var i = 0
        return Array(s).enumerated().reduce(into: "") { r, item in
            if i < spaces.count && item.offset == spaces[i] {
                i += 1
                r.append(" ")
            }
            r.append(item.element)
        }
    }
}
