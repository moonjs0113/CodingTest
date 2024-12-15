/*
  Count Unguarded Cells in the Grid
  URL: https://leetcode.com/problems/count-unguarded-cells-in-the-grid
  Difficulty: Medium
  Topic : Array, Matrix, Simulation
*/

class Solution {
    func countUnguarded(_ m: Int, _ n: Int, _ guards: [[Int]], _ walls: [[Int]]) -> Int {
        var result = (m * n) - guards.count - walls.count
        var object: Set<Int> = []
        var isGuarded: Set<Int> = []
        let move = [[1,0],[-1,0],[0,1],[0,-1]]
        for i in (guards + walls) {
            object.insert(n * i[0] + i[1])
        }
        for g in guards {
            for mo in move {
                var p = [g[0] + mo[0], g[1] + mo[1]]
                var isObject = !object.contains(n * p[0] + p[1])
                var isValid = -1 < p[0] && p[0] < m && -1 < p[1] && p[1] < n
                while isValid && isObject {
                    isGuarded.insert(n * p[0] + p[1])
                    p = [p[0] + mo[0], p[1] + mo[1]]
                    isObject = !object.contains(n * p[0] + p[1])
                    isValid = -1 < p[0] && p[0] < m && -1 < p[1] && p[1] < n
                }
            }
        }
        return result - isGuarded.count
    }
}
