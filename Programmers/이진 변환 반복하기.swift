/*
  이진 변환 반복하기
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/70129
  Difficulty: Lv.2
*/

import Foundation

func solution(_ s:String) -> [Int] {
    var result = [0,0]
    var value = s
    while Int(value) != 1 {
        var count = 0
        for c in value {
            if c == "0" {
                result[1] += 1
            } else {
                count += 1
            }
        }
        value = String(count, radix: 2)
        result[0] += 1
    }
    return result
}
