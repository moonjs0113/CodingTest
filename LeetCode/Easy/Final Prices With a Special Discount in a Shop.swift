/*
  Final Prices With a Special Discount in a Shop
  URL: https://leetcode.com/problems/final-prices-with-a-special-discount-in-a-shop
  Difficulty: Easy
  Topic : Array, Stack, Monotonic Stack
*/

class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        var result: [Int] = prices
        var stack: [Int] = []
        for i in 0..<prices.count {
            while !stack.isEmpty {
                if result[stack.last!] < prices[i] { break }
                result[stack.removeLast()] -= prices[i]
            }
            stack.append(i)
        }
        return result
    }
}
