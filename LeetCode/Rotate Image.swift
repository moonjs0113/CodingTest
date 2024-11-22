/*
  Rotate Image
  URL: https://leetcode.com/problems/rotate-image
  Difficulty: Medium
  Topic : Array, Math, Matrix
  
  Deque Source Code: https://github.com/moonjs0113/CodingTest/blob/main/DataStructure/Deque.swift
*/

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        if n == 1 { return }
        var deque = Deque<Int>()
        let move = [[0,1],[1,0],[0,-1],[-1,0]]
        for i in 0..<(n/2) {
            var f = [i, i]
            var mf = 0
            
            var b = [n-1-i, i]
            var mb = 3
            
            let part = (n - i * 2) - 1
            let len = 4 * part
            for j in 0..<len {
                if j < len - part {
                    deque.push(direction: .back, value: matrix[f[0]][f[1]])
                }
                if j < part {
                    matrix[f[0]][f[1]] = matrix[b[0]][b[1]]
                } else {
                    if let value = deque.pop(direction: .front) {
                        matrix[f[0]][f[1]] = value
                    }
                }
                
                if i > f[0] + move[mf][0] || f[0] + move[mf][0] > n - 1 - i
                    || i > f[1] + move[mf][1] || f[1] + move[mf][1] > n - 1 - i {
                    mf = (mf + 1) % 4
                }
                
                if i > b[0] + move[mb][0] || b[0] + move[mb][0] > n - 1 - i
                    || i > b[1] + move[mb][1] || b[1] + move[mb][1] > n - 1 - i {
                    mb = (mb + 1) % 4
                }
                
                f[0] += move[mf][0]
                f[1] += move[mf][1]
                b[0] += move[mb][0]
                b[1] += move[mb][1]
            }
        }
    }
}
