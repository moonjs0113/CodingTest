/*
  가장 먼 노드
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/49189
  Difficulty: Lv.3
  Topic : 그래프
*/

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var childNode: [[Int]] = Array(repeating: [], count: n+1)
    for e in edge {
        childNode[e[0]].append(e[1])
        childNode[e[1]].append(e[0])
    }
    var visited: [Bool] = Array(repeating: false, count: n+1)
    visited[1] = true
    var q = childNode[1]
    var result = 0
    
    while !q.isEmpty {
        var temp: [Int] = []
        result = 0
        for n in q {
            if !visited[n] {
                visited[n] = true
                result += 1
                temp += childNode[n]
            }
        }
        q = temp.filter { !visited[$0] }
    }
    return result
}
