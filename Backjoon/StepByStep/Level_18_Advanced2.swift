import Foundation

/*
 백준 단계 별로 풀어보기
 18단계 심화2 https://www.acmicpc.net/step/54
 경우의 수를 세어 봅시다.
 */

/*
 약수
 https://www.acmicpc.net/problem/1037
 */
readLine()
let nums = readLine()!.split(separator: " ").map { Int($0)! }
print(nums.min()! * nums.max()!)

/*
 인사성 밝은 곰곰이
 https://www.acmicpc.net/problem/25192
 */
var result = 0
var set: Set<String> = []
(0..<Int(readLine()!)!).forEach { _ in
    let chat = readLine()!
    if chat == "ENTER" {
        result += set.count
        set = []
    } else {
        set.insert(chat)
    }
}
print(result + set.count)

/*
 붙임성 좋은 총총이
 https://www.acmicpc.net/problem/26069
 */
var set: Set<String> = ["ChongChong"]
(0..<Int(readLine()!)!).forEach { _ in
    let p = readLine()!.split(separator: " ")
    if set.contains("\(p[0])") || set.contains("\(p[1])") {
        set.insert("\(p[0])")
        set.insert("\(p[1])")
    }
}
print(set.count)
