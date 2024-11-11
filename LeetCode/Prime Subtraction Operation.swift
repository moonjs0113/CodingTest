/*
  Prime Subtraction Operation
  URL: https://leetcode.com/problems/prime-subtraction-operation
  Difficulty: Medium
  Topic : Array, Math, Binary Search, Greedy, Number Theory
*/

import Foundation
class Solution {
    func primeSubOperation(_ nums: [Int]) -> Bool {
        func isPrime(num: Int) -> Bool {
            if num == 2 || num == 3 || num == 5 || num == 7 { return true }
            if num <= 10 { return false }
            for i in 2..<(Int(sqrt(Double(num)))+1) {
                if num % i == 0 { return false }
            }
            return true
        }
        if nums.count == 1 { return true }
        var bound = 0
        var prev = 0
        for i in 0..<nums.count {
            bound = i == 0 ? nums[0] : nums[i] - prev
            if bound <= 0 { return false }
            var largestPrime = 0
            for j in stride(from: bound - 1, to: 1, by: -1) {
                if isPrime(num: j) {
                    largestPrime = j
                    break
                }
            }
            prev = nums[i] - largestPrime
        }
        return true
    }
}
