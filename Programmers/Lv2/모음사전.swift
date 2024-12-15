/*
  모음사전
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/84512
  Difficulty: Lv.2
  Topic : 완전탐색
*/

import Foundation

func solution(_ word:String) -> Int {
    let newWord = word + String(repeating: " ",count: 5 - word.count)
    let vowel = ["A", "E", "I", "O", "U"]
    var value = 1
    var result = 0
    for c in String(newWord.reversed()) {
        let v = "\(c)"
        if v != " " {
            let i = vowel.firstIndex(of: v)!
            result += i * value + 1
        }
        value = (5 * value) + 1 
    }
    return result
}
