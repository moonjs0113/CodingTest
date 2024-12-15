/*
  Find Kth Bit in Nth Binary String
  URL: https://leetcode.com/problems/find-kth-bit-in-nth-binary-string
  Difficulty: Medium
  Topic : String, Recursion, Simulation
*/

import Foundation
class Solution {
    func findKthBit(_ n: Int, _ k: Int) -> Character {
        if n == 1 { return "0" }
        var i = 1
        var count = 0
        var kCopy = k
        while Int(pow(2.0,Double(i))) <= k {
            i += 1
        }
        while true {
            let center = Int(pow(2.0,Double(i-1)))
            if center == kCopy {
                let base = Character(i == 1 ? "0" : "1")
                let invert = Character(i == 1 ? "1" : "0")
                return count % 2 == 0 ? base : invert
            }
            if center < kCopy {
                kCopy = Int(pow(2.0,Double(i))) - kCopy
                count += 1
            }                
            i -= 1
        }
        return "1"
    }
}
