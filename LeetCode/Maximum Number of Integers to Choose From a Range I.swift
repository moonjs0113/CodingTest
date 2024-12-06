/*
  Maximum Number of Integers to Choose From a Range I
  URL: https://leetcode.com/problems/maximum-number-of-integers-to-choose-from-a-range-i
  Difficulty: Medium
  Topic: Array, Hash Table, Binary Search, Greedy, Sorting
*/

class Solution {
    func maxCount(_ banned: [Int], _ n: Int, _ maxSum: Int) -> Int {
        let banSet = Set(banned)
        var result = 0
        var sum = 0
        for n in 1...n {
            if banSet.contains(n) {
                continue
            }
            if sum + n > maxSum {
                break
            }
            sum += n
            result += 1
        }
        return result
    }
}
