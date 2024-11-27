/*
  Shortest Distance After Road Addition Queries I
  URL: https://leetcode.com/problems/shortest-distance-after-road-addition-queries-i
  Difficulty: Medium
  Topic : Array, Breadth-First Search, Graph
*/

class Solution {
    func shortestDistanceAfterQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        var child: [Set<Int>] = Array(repeating: Set<Int>(), count: n)
        (0..<n-1).forEach {
            child[$0] = [$0+1]
        }
        return queries.map { query in
            child[query[0]].insert(query[1])
            var q = child[0]
            var visited: [Bool] = Array(repeating: false, count: n)
            var count = 1
            visited[0] = true
            while !q.contains(n-1) {
                var temp: Set<Int> = []
                for p in q {
                    if !visited[p] {
                        visited[p] = true
                        temp.formUnion(child[p])
                    }
                }
                q = temp
                count += 1
            }
            return count
        }
    }
}
