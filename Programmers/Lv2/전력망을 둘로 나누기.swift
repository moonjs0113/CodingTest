/*
  전력망을 둘로 나누기
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/86971
  Difficulty: Lv.2
  Topic : 완전탐색
*/

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var adjNode: [[Int]] = Array(repeating: [Int](), count: n + 1)
    var visited: [Bool] = Array(repeating: false, count: n + 1)
    var nodeSize: [Int] = Array(repeating: 0, count: n + 1)
    for w in wires {
        adjNode[w[0]].append(w[1])
        adjNode[w[1]].append(w[0])
    }
    
    func DFSforChildCount(index: Int) -> Int {
        visited[index] = true
        var count = 1
        for i in adjNode[index] {
            if visited[i] { continue }
            count += DFSforChildCount(index: i)
        }
        nodeSize[index] = count
        return count
    }
    nodeSize[1] = DFSforChildCount(index: 1)
    
    var result = Int.max
    visited = Array(repeating: false, count: n + 1)
    func DFS(index: Int, parentSize: Int) {
        visited[index] = true
        for i in adjNode[index] {
            if visited[i] { continue }
            let cutSize = nodeSize[index] - nodeSize[i] + parentSize
            result = min(result, abs(cutSize - nodeSize[i]))
            DFS(index: i, parentSize: cutSize)
        }
    }
    DFS(index: 1, parentSize: 0)
    return result
}
