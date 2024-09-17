import Foundation

/*
 백준 단계 별로 풀어보기
 20단계 백트래킹 https://www.acmicpc.net/step/34
 모든 경우를 탐색하는 백트래킹 알고리즘을 배워 봅시다.
 */

/*
 N과 M (1)
 https://www.acmicpc.net/problem/15649
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let array = Array(1...nums[0])
func backtracking(a: [Int], set: Set<Int>) {
    if a.count == nums[1] {
        print(a.reduce("") { $0 + "\($1) " })
        return
    }
    for i in array {
        var next = a
        if !set.contains(i) {
            next.append(i)
            backtracking(a: next, set: set.union([i]))
        }
    }
}
backtracking(a: [], set: [])