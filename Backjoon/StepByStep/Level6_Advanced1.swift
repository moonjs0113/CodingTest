import Foundation

/*
 백준 단계 별로 풀어보기
 6단계 심화1 https://www.acmicpc.net/step/52
 지금까지의 프로그래밍 문법으로 더 어려운 문제들을 풀어봅시다.
 */

/*
 새싹
 https://www.acmicpc.net/problem/25083
 */
print(
"""
         ,r'"7
r`-_   ,'  ,/
 \\. ". L_r'
   `~\\/
      |
      |
"""
)

/*
 킹, 퀸, 룩, 비숍, 나이트, 폰
 https://www.acmicpc.net/problem/3003
 */
print(zip([1,1,2,2,2,8], readLine()!.split(separator: " ").map { Int($0)! }).map { "\($0.0 - $0.1)" }.joined(separator: " "))

/*
 별 찍기 - 7
 https://www.acmicpc.net/problem/2444
 */
let num = Int(readLine()!)!
(0...(num*2-2)).forEach {
    if $0 / num == 0 {
        print(String(repeating: " ", count: num - 1 - $0) + String(repeating: "*", count: $0 * 2 + 1))
    } else {
        print(String(repeating: " ", count: ($0 % num) + 1) + String(repeating: "*", count: ((num * 2 - 2) - $0) * 2 + 1))
    }
}

/*
 팰린드롬인지 확인하기
 https://www.acmicpc.net/problem/10988
 */
let string = Array(readLine()!)
var isPalindrome = true
for i in (0..<((string.count + 1) / 2)) {
    if string[i] != string[string.count - 1 - i] {
        isPalindrome = false
        break
    }
}
print(isPalindrome ? "1" : "0")


/*
 단어 공부
 https://www.acmicpc.net/problem/1157
 */
var count: [String: Int] = [:]
readLine()!.uppercased().forEach {
    if count[String($0)] == nil {
        count[String($0)] = 1
    } else {
        count[String($0)]! += 1
    }
}
let item = count.max { $0.value < $1.value }!
print(count.filter { $0.value == item.value }.count == 1 ? item.key : "?")

/*
 크로아티아 알파벳
 https://www.acmicpc.net/problem/2941
 */
var string = readLine()!
["c=","c-","dz=","d-","lj","nj","s=","z="].forEach {
    string = string.replacingOccurrences(of: $0, with: "0")
}
print(string.count)

/*
 그룹 단어 체커
 https://www.acmicpc.net/problem/1316
 */
print((0..<Int(readLine()!)!).filter { _ in
    let string = readLine()!
    var currentC = "0"
    var group: [String] = []
    for s in Array(string) {
        if currentC != String(s) {
            if group.contains(String(s)) {
                return false
            } else {
                currentC = String(s)
                group.append(currentC)
            }
        }
    }
    return true
}.count)


/*
 너의 평점은
 https://www.acmicpc.net/problem/25206
 */
let gradeTable = [
    "A+" : 4.5, "A0" : 4.0, "B+" : 3.5,
    "B0" : 3.0, "C+" : 2.5, "C0" : 2.0,
    "D+" : 1.5, "D0" : 1.0, "F" : 0.0
]
let total = (0..<20).reduce((0.0, 0.0)) { s, i in
    let lecture = readLine()!.split(separator: " ")
    if gradeTable[String(lecture[2])] != nil {
        let credit = Double(String(lecture[1]))!
        let grade = credit * gradeTable[String(lecture[2])]!
        return (s.0 + credit, s.1 + grade)
    }
    return (s.0, s.1)
}
print(total.1 / total.0)
