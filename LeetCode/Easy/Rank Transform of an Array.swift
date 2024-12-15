/*
  Rank Transform of an Array
  URL: https://leetcode.com/problems/rank-transform-of-an-array
  Difficulty: Easy
  Topic : Array, Hash Table, Sorting
*/

class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        var dict: [Int:Int] = [:]
        arr.forEach { dict[$0] = 0 }
        dict.sorted { $0.key < $1.key }.enumerated().forEach {
            dict[$0.element.key] = $0.offset + 1
        }
        return arr.map { dict[$0] ?? 0 }
    }
}
