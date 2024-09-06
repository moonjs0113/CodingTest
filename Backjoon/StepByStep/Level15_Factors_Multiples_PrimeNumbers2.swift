import Foundation

/*
 백준 단계 별로 풀어보기
 15단계 약수, 배수와 소수 2 https://www.acmicpc.net/step/18
 정수론의 세계로 조금 더 들어가 봅시다.
 */

/*
 최소공배수
 https://www.acmicpc.net/problem/1934
 */
(0..<Int(readLine()!)!).forEach { _ in
    var data = readLine()!.split(separator: " ").map { Int($0)! }
    var result = data[0] * data[1]
    while data[1] != 0 {
        data = [data[1], data[0] % data[1]]
    }
    print(result / data[0])
}

/*
 최소공배수
 https://www.acmicpc.net/problem/13241
 */
var data = readLine()!.split(separator: " ").map { Int($0)! }
var result = data[0] * data[1]
while data[1] != 0 {
    data = [data[1], data[0] % data[1]]
}
print(result / data[0])

/*
 분수 합
 https://www.acmicpc.net/problem/1735
 */
let ab = readLine()!.split(separator: " ").map { Int($0)! }
let cd = readLine()!.split(separator: " ").map { Int($0)! }
var e = ab[0] * cd[1] + ab[1] * cd[0]
var f = ab[1] * cd[1]
var ef = (e, f)
while ef.1 != 0 {
    ef = (ef.1, ef.0 % ef.1)
}
print("\(e / ef.0) \(f / ef.0)")

/*
 가로수
 https://www.acmicpc.net/problem/2485
 */
var ogcd: Int?, oprev: Int?
print((0..<Int(readLine()!)!).compactMap { _ in
    var num = Int(readLine()!)!
    if let prev = oprev {
        oprev = num
        if let gcd = ogcd {
            let gap = num - prev
            var ab: (a: Int, b: Int) = (gcd, gap)
            while ab.b != 0 {
                ab = (ab.b, ab.a % ab.b)
            }
            ogcd = ab.a
            return gap
        } else {
            ogcd = num - prev
            return ogcd
        }
    } else {
        oprev = num
        return nil
    }
}.reduce(0) {
    return $0 + ($1 / (ogcd ?? 1)) - 1
})

/*
 다음 소수
 https://www.acmicpc.net/problem/4134
 */
(0..<Int(readLine()!)!).forEach { _ in
    var num = Int(readLine()!)!
    if num < 9 {
        if num < 3 { print(2) }
        else if num == 3 { print(3) }
        else if num < 6 { print(5) }
        else if num < 8 { print(7) }
        else { print(11) }
        return
    }
    Loop: while true {
        if num % 2 == 0 || num % 3 == 0 || num % 5 == 0 {
            num += 1
            continue
        }
        for i in stride(from: 3, to: Int(sqrt(Double(num)))+1, by: 2) {
            if num % i == 0 {
                num += 1
                continue Loop
            }
        }
        break Loop
    }
    print(num)
}

/*
 소수 구하기
 https://www.acmicpc.net/problem/1929
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
(nums[0]...nums[1]).forEach {
    if $0 < 9 {
        if [2,3,5,7].contains($0) {
            print($0)
        }
        return
    }
    if $0 % 2 == 0 || $0 % 3 == 0 || $0 % 5 == 0 {
        return
    }
    for i in stride(from: 3, to: Int(sqrt(Double($0)))+1, by: 2) {
        if $0 % i == 0 {
            return
        }
    }
    print($0)
}

/*
 베르트랑
 https://www.acmicpc.net/problem/4948
 */
while true {
    let num = Int(readLine()!)!
    if num == 0 { break }
    print(((num+1)...(num*2)).reduce(0) {
        if $1 < 9 {
            if [2,3,5,7].contains($1) { return $0 + 1 }
            return $0
        }
        if $1 % 2 == 0 || $1 % 3 == 0 || $1 % 5 == 0 { return $0 }
        for i in stride(from: 3, to: Int(sqrt(Double($1)))+1, by: 2) {
            if $1 % i == 0 { return $0 }
        }
        return $0 + 1
    })
}

/*
 골드바흐 파티션
 https://www.acmicpc.net/problem/17103
 */
let MAX_NUM = 1000000
var isPrimeNumber = Array(repeating: true, count: MAX_NUM + 1)
isPrimeNumber[0] = false
isPrimeNumber[1] = false

(2..<Int(sqrt(Double(MAX_NUM)) + 1)).forEach { i in
    if isPrimeNumber[i] {
        var j = 2
        while i * j <= MAX_NUM {
            isPrimeNumber[i * j] = false
            j += 1
        }
    }
}
(0..<Int(readLine()!)!).forEach { _ in
    let target = Int(readLine()!)!
    var count = isPrimeNumber[target - 2] ? 1 : 0
    
    for num in stride(from: 3, to: (target/2)+1, by: 2) {
        if isPrimeNumber[num] {
            count += (isPrimeNumber[target - num] ? 1 : 0)
        }
    }
    print(count)
}

/*
 창문 닫기
 https://www.acmicpc.net/problem/13909
 */
print(Int(sqrt(Double(Int(readLine()!)!))))
