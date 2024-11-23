/*
  Rotating the Box
  URL: https://leetcode.com/problems/rotating-the-box
  Difficulty: Medium
  Topic : Array, Two Pointers, Matrix
*/

class Solution {
    func rotateTheBox(_ box: [[Character]]) -> [[Character]] {
        let m = box.count
        let n = box[0].count
        var result: [[Character]] = Array(repeating: Array(repeating: ".", count: m), count: n)
        for i in 0..<m {
            var q: [Int] = []
            var p = 0
            for j in stride(from: n-1, to: -1, by: -1) {
                let e = box[i][j]
                switch e {
                case ".":
                    q.append(m * j + (m - 1 - i))
                case "*":
                    q = []
                    p = 0
                    result[j][m-1-i] = "*"
                case "#":
                    if q.isEmpty {
                        result[j][m-1-i] = "#"
                    } else {
                        result[q[p] / m][q[p] % m] = "#"
                        q.append(m * j + (m - 1 - i))
                        p += 1
                    }
                default:
                    break
                }
            }
        }
        return result
    }
}
