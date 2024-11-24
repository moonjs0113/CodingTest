/*
  Maximum Matrix Sum
  URL: https://leetcode.com/problems/maximum-matrix-sum
  Difficulty: Medium
  Topic : Array, Greedy, Matrix
*/

class Solution {
    func maxMatrixSum(_ matrix: [[Int]]) -> Int {
        var minus = 0
        var result = 0
        var temp = Int.max
        
        for r in matrix {
            for value in r {
                result += abs(value)
                minus += value < 0 ? 1 : 0
                temp = min(temp, abs(value))
            }
        }
        if minus % 2 != 0 {
            result -= 2 * temp
        }
        return result
    }
}
