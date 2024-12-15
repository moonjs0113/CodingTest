/*
  Diagonal Traverse
  URL: https://leetcode.com/problems/diagonal-traverse
  Difficulty: Medium
  Topic : Array, Matrix, Simulation
*/

class Solution {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        var result: [Int] = []
        let w = mat[0].count
        let h = mat.count
        let move = [[-1,1], [1,-1]]
        var m = 0
        var p = [0,0]

        func isValid(x: Int, y: Int) -> Bool {
            0 <= x && x < h && 0 <= y && y < w
        }

        while result.count < w * h {
            result.append(mat[p[0]][p[1]])
            p[0] += move[m][0]
            p[1] += move[m][1]
            if !isValid(x: p[0], y: p[1]) {
                if m == 0 {
                    m = 1
                    p[0] += 1
                } else {
                    m = 0
                    p[1] += 1
                }
                if !isValid(x: p[0], y: p[1]) {
                    p[0] += move[m][0]
                    p[1] += move[m][1]
                }
            }
        }
        return result
    }
}
