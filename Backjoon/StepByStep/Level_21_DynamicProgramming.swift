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

/*
 RGB거리
 https://www.acmicpc.net/problem/1149
 */
let rgb = (0..<Int(readLine()!)!).map { _ in
    readLine()!.split(separator: " ").map{ Int($0)! }
}
var cost = [0,0,0]
for rbgCost in rgb.reversed() {
    (0..<3).forEach { i in
        cost[i] += rbgCost[i]
    }
    let sortedCost = cost.sorted()
    let min = sortedCost.first!
    let minIndex = cost.firstIndex(of: min)!
    (0..<3).forEach { i in
        cost[i] = (i != minIndex ? min : sortedCost[1])
    }
}
print(cost.min()!)

/*
 정수 삼각형
 https://www.acmicpc.net/problem/1932
 */
let floors = (0..<Int(readLine()!)!).map { _ in
    readLine()!.split(separator: " ").map{ Int($0)! }
}
print(floors.reversed().reduce([Int]()) { sum, floor in
    if sum.isEmpty { return floor }
    return floor.enumerated().map { item in
        item.element + max(sum[item.offset] , sum[item.offset + 1])
    }
}.first!)

/*
 계단 오르기
 https://www.acmicpc.net/problem/2579
 */
let point = (0..<Int(readLine()!)!).map { _ in Int(readLine()!)! }
var cache: [Int: Int] = [:]
func stair(_ i: Int) -> Int {
    if i == 0 { return point[0] }
    else if i == 1 { return point[0] + point[1] }
    else if i == 2 { return max(point[0], point[1]) + point[2] }
    if let value = cache[i] { return value }
    let value = max(stair(i-2), stair(i-3) + point[i-1]) + point[i]
    cache[i] = value
    return value
}
print(stair(point.count-1))

/*
 1로 만들기
 https://www.acmicpc.net/problem/1463
 */
let num = Int(readLine()!)!
func dp(i: Int) -> Int {
    var array: [Int] = [0,0,1,1]
    if i > 3 {
        (4...i).forEach {
            array.append(array[$0 - 1] + 1)
            if $0 % 2 == 0 { array[$0] = min(array[$0], array[$0 / 2] + 1) }
            if $0 % 3 == 0 { array[$0] = min(array[$0], array[$0 / 3] + 1) }
        }
    }
    return array[i]
}
print(dp(i: num))

/*
 쉬운 계단 수
 https://www.acmicpc.net/problem/10844
 */
let n = Int(readLine()!)!
var nums: [Int: Int] = [0:0, 1:1, 2:1, 3:1, 4:1, 5:1, 6:1, 7:1, 8:1, 9:1]
(1..<n).forEach { _ in
    var tempNums: [Int: Int] = [:]
    (0...9).forEach { k in
        if nums[k]! > 0 {
            let count = nums[k]!
            tempNums[k-1] = (tempNums[k-1] ?? 0) + (nums[k]! % 1_000_000_000)
            tempNums[k+1] = (tempNums[k+1] ?? 0) + (nums[k]! % 1_000_000_000)
        }
    }
    nums = tempNums
}
print((0...9).reduce(0) { $0 + nums[$1]! } % 1_000_000_000)

/*
 포도주 시식
 https://www.acmicpc.net/problem/2156
 */
let n = Int(readLine()!)!
let wine = (0..<n).map { _ in Int(readLine()!)! }
var dp = [wine[0]]
if n == 1 { print(dp[0]) }
else {
    dp.append(wine[0] + wine[1])
    if n == 2 { print(dp[1]) }
    else {
        dp.append(max(wine[0] + wine[1], wine[0] + wine[2], wine[1] + wine[2]))
        for i in 3..<n {
            dp.append(max(dp[i-1], dp[i-2] + wine[i], dp[i-3] + wine[i] + wine[i-1]))
        }
        print(dp[n-1])
    }
}

