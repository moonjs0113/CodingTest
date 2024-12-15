/*
  Longest Square Streak in an Array
  URL: https://leetcode.com/problems/longest-square-streak-in-an-array
  Difficulty: Medium
  Topic : Array, Hash Table, Binary Search, Dynamic Programming, Sorting
*/

class Solution {
    func longestSquareStreak(_ nums: [Int]) -> Int {
        let set = Set(nums)
        var cache: Set<Int> = []
        var r = -1
        var i = 0
        while i < nums.count {
            var n = nums[i]
            if !cache.contains(n) {
                cache.insert(n)
                var count = 1
                while set.contains(n*n) {
                    count += 1
                    n *= n
                    cache.insert(n)
                }
                if count > 1 {
                    r = max(r, count)
                }
            }
            i += 1
        }
        return r
    }
}
