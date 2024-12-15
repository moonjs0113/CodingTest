/*
  Minimum Obstacle Removal to Reach Corner
  URL: https://leetcode.com/problems/minimum-obstacle-removal-to-reach-corner
  Difficulty: Hard
  Topic : Array, Breadth-First Search, Graph, Heap (Priority Queue), Matrix, Shortest Path
  Deque Source: https://github.com/moonjs0113/CodingTest/blob/main/DataStructure/Deque.swift
*/

class Solution {
    func minimumObstacles(_ grid: [[Int]]) -> Int {
        let move = [[0,1], [0,-1], [1,0], [-1,0]]
        let m = grid.count
        let n = grid[0].count
        let INF = 1_000_000
        var result = Array(repeating: Array(repeating: INF, count: n), count: m)
        result[0][0] = 0
        var deque = Deque<(Int,Int,Int)>()
        deque.push(direction: .front, value: (0,0,0))
        while deque.count > 0 {
            let value = deque.pop(direction: .front) ?? (0,0,0)
            let ob = value.0
            let p = [value.1, value.2]
            for mo in move {
                let newP = [p[0] + mo[0], p[1] + mo[1]]
                if 0 <= newP[0] && newP[0] < m && 0 <= newP[1] && newP[1] < n {
                    if result[newP[0]][newP[1]] == INF {
                        if grid[newP[0]][newP[1]] == 1 {
                            result[newP[0]][newP[1]] = ob + 1
                            deque.push(direction: .back, value: (ob + 1, newP[0], newP[1]))
                        } else {
                            result[newP[0]][newP[1]] = ob
                            deque.push(direction: .front, value: (ob, newP[0], newP[1]))
                        }
                    }
                }
            }
        }
        return result[m - 1][n - 1]
    }
}
