/*
  Maximum Beauty of an Array After Applying Operation
  URL: https://leetcode.com/problems/maximum-beauty-of-an-array-after-applying-operation
  Difficulty: Medium
  Topic : Array, Binary Search, Sliding Window, Sorting
*/

class Solution {
    func maximumBeauty(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var maxValue = 0
        for i in nums.enumerated() {
            var u = 0
            var l = 0
            var h = nums.count - 1
            while l <= h {
                let m = l + (h - l) / 2
                if nums[m] <= (i.element + 2 * k) {
                    u = m
                    l = m + 1
                } else {
                    h = m - 1
                }
            }
            maxValue = max(maxValue, u - i.offset + 1)
        }
        return maxValue
    }
}
