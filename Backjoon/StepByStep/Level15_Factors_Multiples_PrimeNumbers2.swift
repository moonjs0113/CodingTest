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
