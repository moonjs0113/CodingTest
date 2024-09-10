import Foundation 

/*
 백준 단계 별로 풀어보기
 8단계 일반 수학 1 https://www.acmicpc.net/step/8
 배열 안에 배열이 있다면 어떨까요? 2차원 배열을 만들어 봅시다.
 */

/*
 진법 변환
 https://www.acmicpc.net/problem/2745
 */
let line = readLine()!.split(separator: " ")
print(Int(line[0], radix: Int(line[1])!)!)

/*
 진법 변환 2
 https://www.acmicpc.net/problem/11005
 */
let line = readLine()!.split(separator: " ").map { Int($0)! }
print(String(line[0], radix: line[1], uppercase: true))

/*
 세탁소 사장 동혁
 https://www.acmicpc.net/problem/2720
 */
let units = [25, 10, 5, 1]
(0..<Int(readLine()!)!).forEach { _ in
    var m = Int(readLine()!)!
    let result = units.map { unit -> (Int) in
        let count: Int = m / unit
        m -= count * unit
        return count
    }
    print(result.map { String($0) }.joined(separator: " "))
}

/*
 중앙 이동 알고리즘
 https://www.acmicpc.net/problem/2720
 */
var n = 2
(0..<Int(readLine()!)!).forEach { _ in
    n = (2 * n) - 1
}
print(n * n)

/*
 벌집
 https://www.acmicpc.net/problem/2292
 */
var target = Int(readLine()!)! - 1
var distance = 0
var num = 0
while true {
    if target <= num { break }
    distance += 1
    num += (distance * 6)
}
print(distance + 1)

/*
 분수찾기
 https://www.acmicpc.net/problem/1193
 */
let target = Int(readLine()!)!
var num = 1, step = 1
while true {
    if target <= num { break }
    step += 1
    num += step
}
let sub = num - target
print(step % 2 == 0 ? "\(step - sub)/\(1 + sub)" : "\(1 + sub)/\(step - sub)")

/*
 달팽이는 올라가고 싶다
 https://www.acmicpc.net/problem/2869
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let dailyStep = nums[0] - nums[1]
let result = ((nums[2] - nums[0]) / dailyStep) + 1
print((nums[2] - nums[0]) % dailyStep == 0 ? result : result + 1)

