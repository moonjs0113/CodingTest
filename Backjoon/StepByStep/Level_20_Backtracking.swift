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

/*
 N과 M (2)
 https://www.acmicpc.net/problem/15650
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let array = Array(1...nums[0])
func backtracking(a: [Int], i: Int = 0) {
    if a.count == nums[1] {
        print(a.reduce("") { $0 + "\($1) " })
        return
    }
    for index in (i..<nums[0]) {
        if index >= nums[0] { break }
        var next = a
        next.append(array[index])
        backtracking(a: next, i: index + 1)
    }
}
backtracking(a: [])

/*
 N과 M (3)
 https://www.acmicpc.net/problem/15651
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
func backtracking(a: [Int]) {
    if a.count == nums[1] { print(a.reduce("") { $0 + "\($1) " })
    } else { (1...nums[0]).forEach { backtracking(a: a + [$0]) } }
}
backtracking(a: [])

/*
 N과 M (4)
 https://www.acmicpc.net/problem/15652
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
func backtracking(a: [Int], i: Int) {
    if a.count == nums[1] { print(a.reduce("") { $0 + "\($1) " })
    } else {
        ((i+1)...nums[0]).forEach {
            backtracking(a: a + [$0], i: $0 - 1)
        }
    }
}
backtracking(a: [], i: 0)
