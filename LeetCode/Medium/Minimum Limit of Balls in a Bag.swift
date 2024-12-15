/*
  Minimum Limit of Balls in a Bag
  URL: https://leetcode.com/problems/minimum-limit-of-balls-in-a-bag
  Difficulty: Medium
  Topic: Array, Binary Search
*/

class Solution {
    func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {
        var l = 1
        var r = nums.max()!
        while l < r {
            let m = (l + r) / 2
            var totalOperations = 0
            var isPossible = true
            for n in nums {
                totalOperations += (n - 1) / m
                if totalOperations > maxOperations {
                    isPossible = false
                    break
                }
            }

            if isPossible {
                r = m
            } else {
                l = m + 1
            }
        }
        return l
    }
}
