/*
  All Paths From Source to Target
  URL: https://leetcode.com/problems/all-paths-from-source-to-target
  Difficulty: Medium
  Topic: Backtracking, Depth-First Search, Breadth-First Search, Graph
*/

class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result: [[Int]] = []
        let target = graph.count - 1
        func dfs(i: Int, path: [Int]) {
            if i == target {
                result.append(path)
                return
            }
            for next in graph[i] {
                dfs(i: next, path: path + [next])
            }
        }
        dfs(i:0, path: [0])
        return result
    }
}
