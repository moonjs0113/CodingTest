import Foundation

/*
 백준 단계 별로 풀어보기
 4단계 1차원 배열 https://www.acmicpc.net/step/6
 배열을 사용해 봅시다.
 */

/*
 개수 세기
 https://www.acmicpc.net/problem/10807
 */
readLine()
let array: [Int] = readLine()!.split(separator: " ").compactMap{ Int($0) }
let num = Int(readLine()!)!
print(array.filter{ $0 == num }.count)

/*
 X보다 작은 수
 https://www.acmicpc.net/problem/10871
 */
let num = readLine()!.split(separator: " ").compactMap{ Int($0) }.last!
let array: [Int] = readLine()!.split(separator: " ").compactMap{ Int($0) }
print(array.filter{ $0 < num }.map{String($0)}.joined(separator: " "))

/*
 최소, 최대
 https://www.acmicpc.net/problem/10818
 */
readLine()
let array: [Int] = readLine()!.split(separator: " ").compactMap{ Int($0) }
print(array.min()!, array.max()!)

/*
 최댓값
 https://www.acmicpc.net/problem/2562
 */
let array = (0..<9).map { _ in Int(readLine()!)! }
let max = array.max()!
print("\(max)")
print("\(array.firstIndex(of: max)! + 1)")

/*
 공 넣기
 https://www.acmicpc.net/problem/10810
 */
let f = readLine()!.split(separator: " ").compactMap{ Int($0) }
var basket = Array(repeating: 0, count: f[0])
(0..<f[1]).forEach { _ in
    let action = readLine()!.split(separator: " ").compactMap{ Int($0) }
    (action[0]...action[1]).forEach {
        basket[$0 - 1] = action[2]
    }
}
print(basket.map{String($0)}.joined(separator: " "))

/*
 공 바꾸기
 https://www.acmicpc.net/problem/10813
 */
let f = readLine()!.split(separator: " ")
var basket = Array(1...Int(f.first!)!)
(0..<Int(f.last!)!).forEach { _ in
    let action = readLine()!.split(separator: " ").compactMap{ Int($0) }
    basket.swapAt(action[0] - 1, action[1] - 1)
}
print(basket.map{String($0)}.joined(separator: " "))

/*
 과제 안 내신 분..?
 https://www.acmicpc.net/problem/5597
 */
let students = Set(1...30).subtracting(Set((0..<28).map { _ in Int(readLine()!)! }))
print(students.min()!)
print(students.max()!)

/*
 나머지
 https://www.acmicpc.net/problem/3052
 */
print(Set((0..<10).map { _ in Int(readLine()!)! % 42 }).count)

/*
 바구니 뒤집기
 https://www.acmicpc.net/problem/10811
 */
let f = readLine()!.split(separator: " ")
var basket = Array(1...Int(f.first!)!)
(0..<Int(f.last!)!).forEach { _ in
    let action = readLine()!.split(separator: " ").map { Int($0)! - 1  }
    zip(action[0]...action[1], basket[action[0]...action[1]].reversed()).forEach {
        basket[$0.0] = $0.1
    }
}
print(basket.map{String($0)}.joined(separator: " "))

/*
 평균
 https://www.acmicpc.net/problem/1546
 */
readLine()
var array = readLine()!.split(separator: " ").compactMap{ Double($0) }
let max = array.max()!
print((array.reduce(0.0) { $0 + ((Double($1)/max)*100.0) }) / Double(array.count))

