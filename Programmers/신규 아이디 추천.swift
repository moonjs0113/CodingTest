/*
  신규 아이디 추천
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/72410
  Difficulty: Lv.1
  Topic : 2021 KAKAO BLIND RECRUITMENT
*/

import Foundation

func solution(_ new_id:String) -> String {
    var newID = new_id.lowercased()
    var characterSet = CharacterSet.lowercaseLetters
    characterSet.formUnion(.decimalDigits)
    characterSet.insert(".")
    characterSet.insert("_")
    characterSet.insert("-")
    newID = newID.filter { characterSet.contains($0.unicodeScalars.first!) }
    var flag = true
    newID = newID.filter {
        let s = "\($0)"
        if s == "." {
            if flag {
                flag = false
                return true
            }
        } else {
            flag = true
        }
        return flag
    }
    if let f = newID.first, f == "." {
        newID.removeFirst()
    }
    if let l = newID.last, l == "." {
        newID.removeLast()
    }
    if newID.isEmpty {
        return "aaa"
    }
    while newID.count > 15 {
        newID.removeLast()
    }
    if newID.last! == "." {
        newID.removeLast()
    }
    if newID.count == 2 {
        return "\(newID)\(newID.last!)"
    }
    if newID.count == 1 {
        return "\(newID)\(newID)\(newID)"
    }
    return newID
}
