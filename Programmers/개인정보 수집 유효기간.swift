/*
  개인정보 수집 유효기간(Expiration date of personal information)
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/150370
  Difficulty: Lv.1
  Topic : 2023 KAKAO BLIND RECRUITMENT
*/


import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var termDict: [String: Int] = [:]
    let todayComponents = today.components(separatedBy: ".")
    let todayValue = [Int(todayComponents[0])!,Int(todayComponents[1])!,Int(todayComponents[2])!]
    terms.forEach {
        let t = $0.components(separatedBy: " ")
        termDict[t[0]] = Int(t[1])!
    }
    return (1...privacies.count).filter { i in
        let p = privacies[i-1].components(separatedBy: " ")
        let date = expirationDate(p[0], m: termDict[p[1]]!)
        return compareDates(todayValue, date)
    }
}

func expirationDate(_ date: String, m: Int) -> [Int] {
    let dateComponents = date.components(separatedBy: ".")
    var date = [Int(dateComponents[0])!,Int(dateComponents[1])!,Int(dateComponents[2])!]
    date[2] -= 1
    if date[2] == 0 {
        date[2] = 28
        date[1] -= 1
        if date[1] == 0 {
            date[1] = 12
            date[0] -= 1
        }
    }
    date[1] += m
    if date[1] > 12 {
        let isDec = (date[1] % 12 == 0)
        date[0] += ((date[1] / 12) + (isDec ? -1 : 0))
        date[1] = isDec ? 12 : (date[1] % 12)
    }
    return date
}

func compareDates(_ today: [Int], _ date: [Int]) -> Bool {
    let todayValue = "\(today[0])\(String(format: "%.2d", today[1]))\(String(format: "%.2d", today[2]))"
    let dateValue = "\(date[0])\(String(format: "%.2d", date[1]))\(String(format: "%.2d", date[2]))"
    return todayValue > dateValue
}
