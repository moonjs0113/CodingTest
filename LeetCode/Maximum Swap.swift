/*
  Maximum Swap
  URL: https://leetcode.com/problems/maximum-swap
  Difficulty: Medium
  Topic: Math, Greedy
*/

class Solution {
    func maximumSwap(_ num: Int) -> Int {
        var nums = String(num).map { Int("\($0)")! }
        var index = 0
        var flag = false
        while index < nums.count {
            let maxNum = nums[index...(nums.count-1)].max()!
            let maxNumIndex = nums.lastIndex(of: maxNum)!
            while index <= maxNumIndex {
                if nums[index] < maxNum {
                    nums[maxNumIndex] = nums[index]
                    nums[index] = maxNum
                    flag = true
                    break
                }
                index += 1
            }
            if flag { break }
        }
        return Int(nums.reduce(into: "") { $0 += "\($1)" })!
    }
}
