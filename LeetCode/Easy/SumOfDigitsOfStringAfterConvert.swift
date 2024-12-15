/*
  Sum of Digits of String After Convert
  URL: https://leetcode.com/problems/sum-of-digits-of-string-after-convert/
  Difficulty: Easy
  Topic : String, Simulation
*/

class Solution {
    func getLucky(_ s: String, _ k: Int) -> Int {
        var num = Array(s).map { String($0.asciiValue! - 96) }.joined(separator: "")
        for _ in (0..<k) {
            if num.count == 1 { break }
            num = String(num.reduce(0) { $0 + Int("\($1)")! })
        }
        return Int(num)!
    }
}
