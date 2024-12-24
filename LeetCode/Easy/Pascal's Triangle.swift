/*
  Pascal's Triangle
  URL: https://leetcode.com/problems/pascals-triangle
  Difficulty: Easy
  Topic: Array, Dynamic Programming
*/

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[1]]
        for _ in 1..<numRows {
            let last = result.last!
            var row = [1]
            for i in 0..<last.count-1 {
                row.append(last[i] + last[i+1])
            }
            row.append(1)
            result.append(row)
        }
        return result
    }
}
