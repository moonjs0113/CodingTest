import Foundation

/*
 백준 단계 별로 풀어보기
 23단계 그리디 알고리즘 https://www.acmicpc.net/step/33
 특정 상황에서 성립하는 그리디 알고리즘을 배워 봅시다.
 */

/*
 동전 0
 https://www.acmicpc.net/problem/11047
 */
var input = readLine()!.split(separator: " ").map { Int("\($0)")! }
let coins = (0..<input[0]).map { _ in Int(readLine()!)! }
var count = 0
for cost in coins.reversed() {
    if input[1] >= cost {
        count += input[1] / cost
        input[1] %= cost
    }
    if input[1] == 0 { break }
}
print(count)

/*
 회의실 배정
 https://www.acmicpc.net/problem/1931
 */
var times: [(Int,Int)] = []
(0..<Int(readLine()!)!).forEach { _ in
    let time = readLine()!.split(separator: " ").map { Int("\($0)")! }
    times.append((time.first!, time.last!))
}
times.sort {
    ($0.1) < ($1.1) || ($0.1 == $1.1 && $0.0 < $1.0)
}
var s: [(Int,Int)] = [(0,0)]
for t in times {
    if s.last!.1 <= t.0 {
        s.append(t)
    }
}
print(s.count - 1)
