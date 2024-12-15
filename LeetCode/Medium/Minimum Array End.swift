/*
  Minimum Array End
  URL: https://leetcode.com/problems/minimum-array-end
  Difficulty: Medium
  Topic : Bit Manipulation
*/

import Foundation

class Solution {
    func minEnd(_ n: Int, _ x: Int) -> Int {
        let xBinString = "0\(String(x, radix:2))".reversed()
        var binaryPow: [Int] = []
        for item in xBinString.enumerated() {
            if item.element == "0" {
                binaryPow.append(item.offset)
            }
        }
        let nBinString = String(n-1, radix:2).reversed()
        var result = 0
        for item in nBinString.enumerated() {
            if item.element == "1" {
                var nPow = 0
                if binaryPow.count > item.offset {
                    nPow = binaryPow[item.offset]
                } else {
                    nPow = binaryPow.last! + item.offset - binaryPow.count + 1
                }
                result += Int(pow(2.0,Double(nPow)))
            }
        }
        return x + result
    }
}
