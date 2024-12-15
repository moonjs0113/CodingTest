/*
  Delete Characters to Make Fancy String
  URL: https://leetcode.com/problems/delete-characters-to-make-fancy-string
  Difficulty: Easy
  Topic : String
*/

class Solution {
    func makeFancyString(_ s: String) -> String {
        s.reduce(into: (Character(" "),0,"")) { p, c in 
            if c == p.0 {
                if p.1 < 2 {
                    p.2 += "\(c)"
                }
                p.1 += 1
            } else {
                p.0 = c
                p.1 = 1
                p.2 += "\(c)"
            }
        }.2
    }
}
