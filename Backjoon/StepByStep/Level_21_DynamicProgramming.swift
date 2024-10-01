import Foundation

/*
 백준 단계 별로 풀어보기
 21단계 동적 계획법 1 https://www.acmicpc.net/step/16
 기초적인 동적 계획법 문제들을 풀어봅시다.
 */

/*
 알고리즘 수업 - 피보나치 수 1
 https://www.acmicpc.net/problem/24416
 */
func dp(n: Int) -> String {
    var c = 0
    var f = [1,1]
    for i in 0..<n-2 {
        f.append(f[i] + f[i+1])
        c += 1
    }
    return "\(f.last!) \(c)"
}
print(dp(n: Int(readLine()!)!))

/*
 신나는 함수 실행
 https://www.acmicpc.net/problem/9184
 */
var dict: [String: Int] = [:]
func recursion(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if let value = dict["\(a) \(b) \(c)"] { return value }
    if a <= 0 || b <= 0 || c <= 0 { return 1 }
    if a > 20 || b > 20 || c > 20 {
        let value = recursion(20,20,20)
        dict["20 20 20"] = value
        return value
    }
    if a <= b || a <= c {
        dict["\(a) \(b) \(c)"] = Int(pow(2.0, Float(a)))
        return dict["\(a) \(b) \(c)"]!
    }
    if a < b && b < c {
        let value = recursion(a, b, c-1) + recursion(a, b-1, c-1) - recursion(a, b-1, c)
        dict["\(a) \(b) \(c)"] = value
        return value
    }
    let value = recursion(a-1, b, c) + recursion(a-1, b-1, c) + recursion(a-1, b, c-1) - recursion(a-1, b-1, c-1)
    dict["\(a) \(b) \(c)"] = value
    return value
}

while true {
    let nums = readLine()!.split(separator: " ").map{ Int($0)! }
    if nums.first! == -1 && Set(nums).count == 1 { break }
    dict = [:]
    let value = recursion(nums[0], nums[1], nums[2])
    print("w(\(nums[0]), \(nums[1]), \(nums[2])) = \(value)")
}

/*
 01타일
 https://www.acmicpc.net/problem/1904
 */
func dp(n: Int) -> Int {
    if n < 3 { return n }
    var n0 = 1
    var n1 = 2
    var result = 0
    for i in 0..<n-2 {
        result = (n0 + n1) % 15746
        n0 = n1
        n1 = result
    }
    return result
}
print(dp(n: Int(readLine()!)!))

/*
 파도반 수열
 https://www.acmicpc.net/problem/9461
 */
var f = [1,1,1,2,2]
func dp(n: Int) -> Int {
    if n < 6 { return f[n-1] }
    for i in (f.count-5)..<n-5 {
        f.append(f.last! + f[i])
    }
    return f.last!
}
(0..<Int(readLine()!)!).forEach { _ in
    let num = Int(readLine()!)!
    print(f.count >= num ? f[num-1]: dp(n: num))
}

/*
 연속합
 https://www.acmicpc.net/problem/1912
 */
let count = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{ Int($0)! }
var temp = nums.first!
var result = nums.first!
for i in 1..<count {
    temp = max(nums[i], temp + nums[i])
    result = max(result, temp)
}
print(result)
