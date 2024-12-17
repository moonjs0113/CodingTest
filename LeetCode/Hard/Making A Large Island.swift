/*
  Making A Large Island
  URL: https://leetcode.com/problems/making-a-large-island
  Difficulty: Hard
  Topic : Array, Depth-First Search, Breadth-First Search, Union Find, Matrix
*/

class Solution {
    var n = 0
    let move = [[1,0],[0,1],[-1,0],[0,-1]]
    func isValid(x: Int, y: Int) -> Bool {
        0 <= x && x < n && 0 <= y && y < n
    }
    
    func largestIsland(_ grid: [[Int]]) -> Int {
        n = grid.count
        var island = Array(repeating: Array(repeating: 0, count: n), count: n)
        var islandSize: [Int] = [0]
        var islandID = 1
        var sea: [[Int]] = []
        var visited = Array(repeating: false, count: n * n)

        for i in 0..<n {
            for j in 0..<n {
                if visited[i * n + j] {
                    continue
                }
                if grid[i][j] == 0 {
                    var count = 0
                    for m in move {
                        let np = [i + m[0], j + m[1]]
                        if isValid(x: np[0], y: np[1]) {
                            if grid[np[0]][np[1]] == 1 {
                                count += 1
                            }
                        }
                    }
                    if count > 0 {
                        sea.append([i,j])
                    }
                    continue
                }
                var land: [[Int]] = []
                var q = [[i,j]]
                visited[i * n + j] = true
                var size = 1
                while !q.isEmpty {
                    land += q
                    var buffer: [[Int]] = []
                    for p in q {
                        island[p[0]][p[1]] = islandID
                        for m in move {
                            let np = [p[0] + m[0], p[1] + m[1]]
                            if isValid(x: np[0], y: np[1]) {
                                if grid[np[0]][np[1]] == 1 {
                                    if !visited[np[0] * n + np[1]] {
                                        visited[np[0] * n + np[1]] = true
                                        size += 1
                                        buffer.append(np)
                                    }
                                }
                            }
                        }
                    }
                    q = buffer
                }
                islandSize.append(size)
                islandID += 1
            }
        }
        if islandSize.count == 1 { return 1 }
        if islandSize.count == 2 {
            let size = islandSize.last!
            if size == n * n { return n * n }
            return size + 1
        }

        var result = 0
        for s in sea {
            var id: Set<Int> = []
            for m in move {
                let x = s[0] + m[0]
                let y = s[1] + m[1]
                if isValid(x: x, y: y) {
                    if island[x][y] != 0 {
                        id.insert(island[x][y])
                    }
                }
            }
            result = max(result,id.reduce(into: 1) { $0 += islandSize[$1] })
        }
        return result
    }
}
