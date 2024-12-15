/*
  순위
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/49191
  Difficulty: Lv.3
  Topic : 그래프
*/

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    // 0: 자신 or 모름, 1: 이김, 2: 짐
    var table = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    for r in results {
        table[r[0]][r[1]] = 1
        table[r[1]][r[0]] = 2
    }
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if table[i][k] == 1 && table[k][j] == 1 {
                    table[i][j] = 1
                    table[j][i] = 2
                }
                if table[i][k] == 2 && table[k][j] == 2 {
                    table[i][j] = 2
                    table[j][i] = 1
                } 
            }
        }
    }
    
    var result = 0
    for i in 1...n {
        var zeroCount = 0
        for j in 1...n {
            if table[i][j] == 0 {
                zeroCount += 1
            }
            if zeroCount > 1 {
                break
            }
        }
       if zeroCount == 1 {
           result += 1
       }
    }
    return result
}
