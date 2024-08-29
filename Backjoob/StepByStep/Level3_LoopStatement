import Foundation

/*
 백준 단계 별로 풀어보기
 3단계 반복문 https://www.acmicpc.net/step/3
 for, while 등의 반복문을 사용해 봅시다.
 */

/*
 구구단
 https://www.acmicpc.net/problem/2739
 */
let num = Int(readLine()!)!
(1...9).forEach {
    print("\(num) * \($0) = \(num*$0)")
}

/*
 A+B - 3
 https://www.acmicpc.net/problem/10950
 */
(0..<Int(readLine()!)!).forEach { _ in
  print("\(readLine()!.split(separator: " ").reduce(0) { $0 + Int($1)! })")
}

/*
 합
 https://www.acmicpc.net/problem/8393
 */
let num = Int(readLine()!)!
print("\((num * (num + 1)) / 2)")
// print("\((1...Int(readLine()!)!).reduce(0,+))")

/*
 영수증
 https://www.acmicpc.net/problem/25304
 */
let price = Int(readLine()!)!
let total = (0..<Int(readLine()!)!).reduce(0) { p, _ in
    p + readLine()!.split(separator: " ").reduce(1) { $0 * Int($1)! }
}
print("\(price == total ? "Yes" : "No" )")

/*
 코딩은 체육과목 입니다
 https://www.acmicpc.net/problem/25314
 */
print(String(repeating: "long ", count: Int(readLine()!)! / 4) + "int")

/*
 빠른 A+B
 https://www.acmicpc.net/problem/15552
 */
// TODO: - 참고하고 이해할 것
// https://velog.io/@comdongsam/Swift-15552-%EB%B9%A0%EB%A5%B8-A-B
// https://gist.github.com/JCSooHwanCho/30be4b669321e7a135b84a1e9b075f88

/*
 A+B - 7
 https://www.acmicpc.net/problem/11021
 */
(0..<Int(readLine()!)!).forEach {
    print("Case #\($0+1): \(readLine()!.split(separator: " ").reduce(0) { $0 + Int($1)! })")
}

/*
 A+B - 8
 https://www.acmicpc.net/problem/11022
 */
(0..<Int(readLine()!)!).forEach {
    let nums = readLine()!.split(separator: " ").compactMap{Int($0)}
    print("Case #\($0+1): \(nums[0]) + \(nums[1]) = \(nums[0] + nums[1])")
}

/*
 별 찍기 - 1
 https://www.acmicpc.net/problem/2438
 */
(1...Int(readLine()!)!).forEach { print(String(repeating: "*", count: $0)) }

/*
 별 찍기 - 2
 https://www.acmicpc.net/problem/2439
 */
let num = Int(readLine()!)!
(1...num).forEach {
    print(String(repeating: " ", count: num - $0) + String(repeating: "*", count: $0))
}

/*
 A+B - 5
 https://www.acmicpc.net/problem/10952
 */
while true {
    let line = readLine()!.split(separator: " ")
    if line[0] == "0" && line[1] == "0" {
        break
    }
    print(line.reduce(0) { $0 + Int($1)! })
}

/*
 A+B - 4
 https://www.acmicpc.net/problem/10951
 */
while true {
    guard let line = readLine() else {
        break
    }
    print(line.split(separator: " ").reduce(0) { $0 + Int($1)! })
}
