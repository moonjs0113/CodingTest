/*
  Take Gifts From the Richest Pile
  URL: https://leetcode.com/problems/take-gifts-from-the-richest-pile
  Difficulty: Easy
  Topic: Array, Heap (Priority Queue), Simulation
*/

import Foundation

class Solution {
    func pickGifts(_ gifts: [Int], _ k: Int) -> Int {
        var result = 0
        var gifts = gifts
        for _ in 0..<k {
            let maxValue = gifts.max()!
            let maxIndex = gifts.firstIndex(of: maxValue)!
            gifts[maxIndex] = Int(sqrt(Double(maxValue)))
        }
        return gifts.reduce(0, +)
    }
}
