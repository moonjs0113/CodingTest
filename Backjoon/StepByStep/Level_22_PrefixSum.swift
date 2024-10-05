import Foundation

/*
 백준 단계 별로 풀어보기
 22단계 누적 합 https://www.acmicpc.net/step/48
 부분구간 안에 있는 수들의 합을 빠르게 구해 봅시다.
 */

/*
 구간 합 구하기 4
 https://www.acmicpc.net/problem/11659
 */
let i = readLine()!.split(separator: " ").map { Int("\($0)")! }
var sums: [Int] = []
var sum = 0
readLine()!.split(separator: " ").map {
    sum += Int("\($0)")!
    sums.append(sum)
}
(0..<i[1]).forEach { _ in
    let range = readLine()!.split(separator: " ").map { Int("\($0)")! }
    if range[0] == 1 {
        print(sums[range[1]-1])
    } else {
        print(sums[range[1]-1] - sums[range[0]-2])
    }
}
