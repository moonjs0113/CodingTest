/*
  Subsets
  URL: https://leetcode.com/problems/3sum/
  Difficulty: Medium
  Topic : Array, Two Pointers, Sorting
*/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var sortedNums = nums.sorted()

        for i in 0..<nums.count {
            if i > 0 && sortedNums[i] == sortedNums[i - 1] { continue }

            var j = i + 1
            var k = nums.count - 1 

            while j < k {
                let sum = sortedNums[i] + sortedNums[j] + sortedNums[k]
                if sum > 0 { 
                    k -= 1
                } else if sum < 0 {
                    j += 1
                } else {
                    result.append([sortedNums[i], sortedNums[j], sortedNums[k]])
                    j += 1

                    while sortedNums[j] == sortedNums[j - 1] && j < k {
                        j += 1
                    }
                }
            }
        }

        return result
    }
}
