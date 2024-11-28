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

/*
 수열
 https://www.acmicpc.net/problem/2559
 */
let i = readLine()!.split(separator: " ").map { Int("\($0)")! }
var sums: [Int] = []
var sum = 0
readLine()!.split(separator: " ").forEach {
    sum += Int("\($0)")!
    sums.append(sum)
}
(0...(i[0] - i[1])).forEach {
    if $0 == 0 { sum = sums[i[1] - 1] }
    else {
        sum = max(sum, sums[$0 + i[1] - 1] - sums[$0 - 1])
    }
}
print(sum)

/*
 인간-컴퓨터 상호작용
 https://www.acmicpc.net/problem/16139
 */
let str = readLine()!
var sums: [[String: Int]] = []
str.enumerated().forEach { item in
    sums.append(item.offset == 0 ? ["\(item.element)":0] : sums[item.offset-1])
    sums[item.offset]["\(item.element)", default: 0] += 1
}

(0..<Int(readLine()!)!).forEach { _ in
    let input = readLine()!.split(separator: " ")
    let j = Int(input[1])!
    let k = Int(input[2])!
    let prev = sums[k]["\(input[0])", default: 0]
    let r = prev - (j == 0 ? 0 : sums[j-1]["\(input[0])", default: 0])
    print(r)
}

/*
 나머지 합
 https://www.acmicpc.net/problem/10986
 */
let input = readLine()!.split(separator: " ").map { Int("\($0)")! }
var count = Array(repeating: 0, count: input[1])
var sum = 0
var result = 0
readLine()!.split(separator: " ").forEach {
    sum = (sum + Int("\($0)")!) % input[1]
    if sum == 0 {
        result += 1
    }
    result += count[sum]
    count[sum] += 1
}
print(result)
