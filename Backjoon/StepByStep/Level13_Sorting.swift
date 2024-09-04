import Foundation

/*
 백준 단계 별로 풀어보기
 13단계 정렬 https://www.acmicpc.net/step/9
 배열의 원소를 순서대로 나열하는 알고리즘을 배워 봅시다.
 */

/*
 수 정렬하기
 https://www.acmicpc.net/problem/2750
 */
(0..<Int(readLine()!)!).map { _ in Int(readLine()!)! }.sorted().forEach { print($0) }

/*
 대표값2
 https://www.acmicpc.net/problem/2587
 */
let nums = (0..<5).map { _ in Int(readLine()!)! }
print(nums.reduce(0, +) / 5)
print(nums.sorted()[2])

/*
 커트라인
 https://www.acmicpc.net/problem/25305
 */
let p = readLine()!.split(separator: " ").map { Int($0)! }
let nums = readLine()!.split(separator: " ").map { Int($0)! }
print(nums.sorted(by: >)[p[1]-1])

/*
 수 정렬하기 2
 https://www.acmicpc.net/problem/2751
 */
(0..<Int(readLine()!)!).map { _ in Int(readLine()!)! }.sorted().forEach { print($0) }

/*
 수 정렬하기 3
 https://www.acmicpc.net/problem/10989
 */
var dic: [Int: Int] = [:]
(0..<Int(readLine()!)!).forEach { _ in
    let num = Int(readLine()!)!
    if dic[num] == nil {
        dic[num] = 1
    } else {
        dic[num]! += 1
    }
}
dic.sorted(by: { $0.key < $1.key }).forEach {
    print(String(repeating: "\($0.key)\n", count: $0.value), terminator: "")
}

/*
 소트인사이드
 https://www.acmicpc.net/problem/1427
 */
print(readLine()!.sorted(by: >).map(String.init).joined(separator: ""))

/*
 좌표 정렬하기
 https://www.acmicpc.net/problem/1427
 */
var dic: [Int: [Int]] = [:]
(0..<Int(readLine()!)!).forEach { _ in
    let num = readLine()!.split(separator: " ").map { Int($0)! }
    if dic[num[0]] == nil {
        dic[num[0]] = [num[1]]
    } else {
        dic[num[0]]!.append(num[1])
    }
}
dic.sorted { $0.key < $1.key }.forEach { item in
    item.value.sorted().forEach {
        print("\(item.key) \($0)")
    }
}

/*
 좌표 정렬하기 2
 https://www.acmicpc.net/problem/11651
 */
var dic: [Int: [Int]] = [:]
(0..<Int(readLine()!)!).forEach { _ in
    let num = readLine()!.split(separator: " ").map { Int($0)! }
    if dic[num[1]] == nil {
        dic[num[1]] = [num[0]]
    } else {
        dic[num[1]]!.append(num[0])
    }
}
dic.sorted { $0.key < $1.key }.forEach { item in
    item.value.sorted().forEach {
        print("\($0) \(item.key)")
    }
}

/*
 단어 정렬
 https://www.acmicpc.net/problem/1181
 */
Set((0..<Int(readLine()!)!).map { _ in readLine()! }).sorted{ $0 < $1 }.sorted { $0.count < $1.count }.forEach { print($0) }

/*
 나이순 정렬
 https://www.acmicpc.net/problem/10814
 */
(0..<Int(readLine()!)!).map { i -> (Int, Int, String) in
    let data = readLine()!.split(separator: " ")
    return (i, Int(data[0])!, String(data[1]))
}
.sorted { $0.1 < $1.1 }
.forEach { print("\($0.1) \($0.2)") }
