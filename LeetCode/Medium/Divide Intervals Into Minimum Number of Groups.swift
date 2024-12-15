/*
  Divide Intervals Into Minimum Number of Groups
  URL: https://leetcode.com/problems/divide-intervals-into-minimum-number-of-groups
  Difficulty: Medium
  Topic : Array, Two Pointers, Greedy, Sorting, Heap (Priority Queue), Prefix Sum
*/

class Solution {
    func minGroups(_ intervals: [[Int]]) -> Int {
        var groups: [Int] = []
        intervals.sorted{ $0.first! < $1.first! }.forEach {
            for i in 0..<groups.count {
                if groups[i] < $0.first! {
                    groups[i] = $0.last!
                    return
                }
            }
            groups.append($0.last!)
        }
        return groups.count
    }
}
