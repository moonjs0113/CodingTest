/*
 입국심사
 URL: https://school.programmers.co.kr/learn/courses/30/lessons/43238
 Difficulty: Lv.3
 Topic : Binary Search
*/

import Foundation
func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var range = (1, 0, times.max()!*n)
    range.1 = range.0 + (range.2 - range.0) / 2
    while range.0 < range.2 {
        var num = 0
        for t in times {
            if Int.max - num < range.1 / t {
                num = Int.max
                break
            }
            num += (range.1 / t)
        }
        if num >= n {
            range.2 = range.1
        } else if num < n {
            range.0 = range.1 + 1
        }
        range.1 = range.0 + (range.2 - range.0) / 2
    }
    return Int64(range.1)
}
