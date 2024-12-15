/*
  Sliding Puzzle
  URL: https://leetcode.com/problems/sliding-puzzle
  Difficulty: Hard
  Topic : Array, Breadth-First Search, Matrix
*/

class Solution {
    func slidingPuzzle(_ board: [[Int]]) -> Int {
        if board == [[1,2,3],[4,5,0]] { return 0 }
        var result = 0
        var q: [([[Int]], [Int])] = []
        let move = [[1,0],[-1,0],[0,1],[0,-1]]
        for i in 0..<2 {
            for j in 0..<3 {
                if 0 == board[i][j] {
                    q.append((board, [i,j]))
                    break
                }
            }
            if !q.isEmpty { break }
        }
        var cache: Set<[[Int]]> = []
        while !q.isEmpty {
            var temp: [([[Int]], [Int])] = []
            result += 1
            for (b, p) in q {
                for m in move {
                    if 0 <= p[0] + m[0] && p[0] + m[0] < 2
                    && 0 <= p[1] + m[1] && p[1] + m[1] < 3 {
                        let newP = [p[0] + m[0], p[1] + m[1]]
                        if newP != p {
                            var newB = b
                            newB[p[0]][p[1]] = newB[newP[0]][newP[1]]
                            newB[newP[0]][newP[1]] = 0
                            if newP == [1,2] && newB == [[1,2,3],[4,5,0]]{
                                return result
                            }
                            if cache.contains(newB) { continue }
                            cache.insert(newB)
                            temp.append((newB, newP))
                        }
                    } 
                }
            }
            q = temp
        }
        return -1
    }
}
