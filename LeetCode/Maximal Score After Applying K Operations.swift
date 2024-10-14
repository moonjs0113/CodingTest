/*
  Maximal Score After Applying K Operations
  URL: https://leetcode.com/problems/maximal-score-after-applying-k-operations
  Difficulty: Medium
  Topic: Array, Greedy, Heap (Priority Queue)
*/

// Use Heap From https://github.com/moonjs0113/CodingTest/blob/main/DataStructure/Heap.swift

class Solution {
    func maxKelements(_ nums: [Int], _ k: Int) -> Int {
        var maxHeap = Heap<Int>(priorityFunction: >)
        var result = 0
        nums.forEach { maxHeap.insert($0) }
        for _ in 0..<k {
            let value = (maxHeap.remove() ?? 0)
            result += value
            maxHeap.insert(Int(ceil(Double(value) / 3.0)))
        }
        return result
    }
}
