/*
  Max Chunks To Make Sorted
  URL: https://leetcode.com/problems/max-chunks-to-make-sorted
  Difficulty: Medium
  Topic: Array, Stack, Greedy, Sorting, Monotonic Stack
*/

class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        (0..<arr.count).reduce(into: (0,0)) { m, i in
            m.0 = max(m.0, arr[i])
            if m.0 == i {
                m.1 += 1
            }
        }.1
    }
}
