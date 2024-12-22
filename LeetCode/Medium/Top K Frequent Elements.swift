/*
  Top K Frequent Elements
  URL: https://leetcode.com/problems/top-k-frequent-elements
  Difficulty: Medium
  Topic: Array, Hash Table, Divide and Conquer, Sorting, Heap (Priority Queue), Bucket Sort, Counting, Quickselect
*/

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequent: [Int: Int] = [:]
        nums.forEach {
            frequent[$0, default: 0] += 1
        }
        return frequent.sorted { $0.value > $1.value }.dropLast(frequent.count - k).map { $0.key }
    }
}
