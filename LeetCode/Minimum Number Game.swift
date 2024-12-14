/*
  Minimum Number Game
  URL: https://leetcode.com/problems/minimum-number-game
  Difficulty: Easy
  Topic: Sorting, Array, Heap (Priority Queue)
*/

class Solution {
    func numberGame(_ nums: [Int]) -> [Int] {
        var result: [Int] = []
        var nums = nums.sorted(by: >)
        while !nums.isEmpty {
            let a = nums.removeLast()
            let b = nums.removeLast()
            result.append(b)
            result.append(a)
        }
        return result
    }
}
