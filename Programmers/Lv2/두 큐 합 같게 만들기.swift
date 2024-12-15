/*
  두 큐 합 같게 만들기
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/118667
  Difficulty: Lv.2
  Topic : 2022 KAKAO TECH INTERNSHIP
*/

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    print(Int.max)
    let n = queue1.count
    var q1 = queue1
    var q2 = queue2
    var p1 = 0
    var p2 = 0
    var sum1 = queue1.reduce(0, +)
    var sum2 = queue2.reduce(0, +)
    if sum1 == sum2 { return 0 }
    if (sum1 + sum2) % 2 != 0 { return -1 }
    var result = 0
    while sum1 != sum2 {
        if sum1 < sum2 {
            q1.append(q2[p2])
            sum1 += q2[p2]
            sum2 -= q2[p2]
            p2 += 1
        } else {
            q2.append(q1[p1])
            sum1 -= q1[p1]
            sum2 += q1[p1]
            p1 += 1
        }
        result += 1
        if result > 2 * (n + 1) {
            return -1
        }
    }
    return result
}
