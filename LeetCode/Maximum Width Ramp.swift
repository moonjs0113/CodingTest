/*
  Maximum Width Ramp
  URL: https://leetcode.com/problems/maximum-width-ramp
  Difficulty: Medium
  Topic : Array, Stack, Monotonic Stack
*/

class Solution {
    func maxWidthRamp(_ nums: [Int]) -> Int {
        var monotonicDecreasingStack: [Int] = [0]
        for i in (0..<nums.count) {
            if nums[monotonicDecreasingStack.last!] > nums[i] {
                monotonicDecreasingStack.append(i)
            }
            if nums[i] == 0 { break }
        }
        print(monotonicDecreasingStack)
        var result = 0
        var count = nums.count - 1
		while !monotonicDecreasingStack.isEmpty && count > 0 {
            while let last = monotonicDecreasingStack.last, nums[last] <= nums[count] {
                result = max(result, count - last)
                _ = monotonicDecreasingStack.popLast()
            }
            count -= 1
        }
        return result
    }
}
