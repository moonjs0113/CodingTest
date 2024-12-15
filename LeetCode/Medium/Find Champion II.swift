/*
  Find Champion II
  URL: https://leetcode.com/problems/find-champion-ii
  Difficulty: Medium
  Topic : Graph
*/

class Solution {
    func findChampion(_ n: Int, _ edges: [[Int]]) -> Int {
        var indegree = Array(repeating: 0, count: n)
        for edge in edges {
            indegree[edge[1]] += 1
        }
        var result: [Int] = []
        for i in 0..<n {
            if indegree[i] == 0 {
                result.append(i)
            }
        }
        return result.count == 1 ? result[0] : -1
    }
}
