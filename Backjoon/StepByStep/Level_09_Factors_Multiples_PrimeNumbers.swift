import Foundation

/*
 백준 단계 별로 풀어보기
 9단계 약수, 배수와 소수 https://www.acmicpc.net/step/10
 약수와 배수는 정수론의 시작점이라고 할 수 있습니다.
 */

/*
 배수와 약수
 https://www.acmicpc.net/problem/5086
 */
while true {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    if nums[0] == nums[1] { break }
    if nums[0] % nums[1] == 0  {
        print("multiple")
    } else if nums[1] % nums[0] == 0 {
        print("factor")
    } else {
        print("neither")
    }
}

/*
 약수 구하기
 https://www.acmicpc.net/problem/2501
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let factors = (1...Int(sqrt(Double(nums[0]))))
    .filter { nums[0] % $0 == 0 }
    .flatMap { $0 * $0 == nums[0] ? [$0] : [$0, nums[0] / $0 ] }
    .sorted()
print(factors.count < nums[1] ? 0 : factors[nums[1]-1])

/*
 약수들의 합
 https://www.acmicpc.net/problem/9506
 */
while true {
    let num = Int(readLine()!)!
    if num < 0 { break }
    if num == 3 {
        print("3 is NOT perfect.")
        continue
    }
    let factors = (2...Int(sqrt(Double(num))))
        .filter { num % $0 == 0 }
        .flatMap { $0 * $0 == num ? [$0] : [$0, num / $0 ] }
        .sorted()
    if factors.reduce(1, +) == num {
        print("\(num) = 1 + \(factors.map(String.init).joined(separator: " + "))")
    } else {
        print("\(num) is NOT perfect.")
    }
}

/*
 소수 찾기
 https://www.acmicpc.net/problem/1978
 */
readLine()
print(readLine()!.split(separator: " ").map { Int($0)! }.filter { num in
    if num == 1 { return false }
    return (1...Int(sqrt(Double(num)))).filter { num % $0 == 0 }.count == 1
}.count)

/*
 소수
 https://www.acmicpc.net/problem/2581
 */
let nums = [Int(readLine()!)!, Int(readLine()!)!]
let primeNums = (nums[0]...nums[1]).filter { num in
    if num == 1 { return false }
    return (1...Int(sqrt(Double(num)))).filter { num % $0 == 0 }.count == 1
}
print(primeNums.isEmpty ? "-1" : "\(primeNums.reduce(0,+))\n\(primeNums.min()!)")

/*
 소인수분해
 https://www.acmicpc.net/problem/11653
 */
var num = Int(readLine()!)!
if num != 1 {
    if num <= 3 { print(num) }
    else {
        var factors = (2...Int(sqrt(Double(num)))).filter { num % $0 == 0 }
        if factors.isEmpty { print(num) }
        else {
            var primeFactors: [Int] = []
            factors = factors.flatMap { [$0, num / $0 ] }.sorted()
            factors.forEach {
                while num % $0 == 0 {
                    num /= $0
                    primeFactors.append($0)
                }
            }
            primeFactors.forEach{ print($0) }
        }
    }
}
