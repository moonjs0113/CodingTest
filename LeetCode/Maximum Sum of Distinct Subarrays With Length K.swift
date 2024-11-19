/*
  Maximum Sum of Distinct Subarrays With Length K
  URL: https://leetcode.com/problems/maximum-sum-of-distinct-subarrays-with-length-k
  Difficulty: Medium
  Topic : Array, Hash Table, Sliding Window
*/

class Solution {
    func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        var e = k - 1
        var result = 0
        var windowSum = 0
        var numsSet: Set<Int> = []
        var cache: [Int:Int] = [:]
        for i in 0...(nums.count-k) {
            if i == 0 {
                for j in i...e {
                    windowSum += nums[j]
                    numsSet.insert(nums[j])
                    cache[nums[j], default: 0] += 1
                }
            } else {
                cache[nums[i-1]]! -= 1
                if cache[nums[i-1]] == 0 {
                    numsSet.remove(nums[i-1])
                }
                cache[nums[e], default: 0] += 1
                numsSet.insert(nums[e])
                windowSum -= nums[i-1]
                windowSum += nums[e]
            }
            if numsSet.count == k {
                result = max(result, windowSum)
            }
            e += 1
        }
        return result
    }
}
