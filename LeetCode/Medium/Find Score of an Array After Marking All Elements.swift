/*
  Find Score of an Array After Marking All Elements
  URL: https://leetcode.com/problems/find-score-of-an-array-after-marking-all-elements
  Difficulty: Medium
  Topic: Heap (Priority Queue), Sorting, Array, Simulation, Hash Table, Ordered Set, Ordered Map, Greedy, Sliding Window, Queue, Data Stream, Stack, Monotonic Stack, String, Tree, Divide and Conquer, Design, Dynamic Programming, Hash Function, Doubly-Linked List, Bit Manipulation, Two Pointers, Radix Sort
*/

class Solution {
    func findScore(_ nums: [Int]) -> Int {
        var score = 0
        var marked = Set<Int>()

        var nums = nums.enumerated().sorted(by: { $0.element < $1.element })

        nums.forEach {
            if marked.contains($0.offset) {
                return
            }
            score += $0.element
            marked.insert($0.offset)
            marked.insert($0.offset - 1)
            marked.insert($0.offset + 1)
        }

        return score
    }
}
