/*
  Count Number of Nice Subarrays
  URL: https://leetcode.com/problems/count-number-of-nice-subarrays
  Difficulty: Medium
  Topic : Array, Hash Table, Math, Sliding Window, Prefix Sum
*/

class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var tempCount = 0
        var odd = 0
        var start = 0
        for end in 0..<nums.count {
            if nums[end] % 2 == 1 {
                odd += 1
            }
            if odd == k {
                tempCount = 0
                while odd == k {
                    odd -= nums[start] % 2
                    tempCount += 1
                    start += 1
                }
            }
            result += tempCount
        }
        return result
    }
}
