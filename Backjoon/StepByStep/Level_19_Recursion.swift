import Foundation

/*
 백준 단계 별로 풀어보기
 19단계 재귀 https://www.acmicpc.net/step/19
 재귀함수를 다뤄 봅시다.
 */

/*
 팩토리얼 2
 https://www.acmicpc.net/problem/27433
 */
let num = Int(readLine()!)!
func factorial(n: Int) -> Int {
    return (n < 2) ? 1 : n * factorial(n: n - 1)
}
print(factorial(n: num))

/*
 피보나치 수 5
 https://www.acmicpc.net/problem/10870
 */
let num = Int(readLine()!)!
func fibonacci(n: Int) -> Int {
    if n < 2 { return n }
    return fibonacci(n: n - 1) + fibonacci(n: n - 2)
}
print(fibonacci(n: num))

/*
 재귀의 귀재
 https://www.acmicpc.net/problem/25501
 */
var count = 0
func recursion(_ s: [Character], _ l: Int, _ r: Int) -> Int {
    count += 1
    if l >= r { return 1 }
    else if s[l] != s[r] { return 0 }
    else { return recursion(s, l+1, r-1) }
}

func isPalindrome(_ s: [Character]) -> Int {
    return recursion(s, 0, s.count - 1)
}

/*
 알고리즘 수업 - 병합 정렬 1
 https://www.acmicpc.net/problem/24060
 */
func merge_sort(_ array: inout [Int], p: Int, r: Int) {
    if num != -1 { return }
    if p < r {
        let q = (p + r) / 2
        merge_sort(&array, p: p, r: q)
        merge_sort(&array, p: q + 1, r: r)
        merge(&array, p: p, q: q, r: r)
    }
}
func merge(_ array: inout [Int], p: Int, q: Int, r: Int) {
    if num != -1 { return }
    var i = p, j = q + 1, t = 0
    while i <= q && j <= r {
        if array[i] <= array[j] {
            temp[t] = array[i]
            t += 1
            i += 1
        } else {
            temp[t] = array[j]
            t += 1
            j += 1
        }
    }
    while i <= q {
        temp[t] = array[i]
        t += 1
        i += 1
    }
    while j <= r {
        temp[t] = array[j]
        t += 1
        j += 1
    }
    i = p
    t = 0
    while i <= r {
        target += 1
        if target == k {
            num = temp[t]
            break
        }
        array[i] = temp[t]
        t += 1
        i += 1
    }
}
func recursion(n: Int) -> Int {
    if n == 1 { return 0 }
    if n == 2 { return n }
    return n + recursion(n: n / 2) + recursion(n: (n / 2) + (n % 2))
}
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let len = nums.first!
let k = nums.last!
let max = recursion(n: len)
var target = 0
var num = -1
var array = readLine()!.split(separator: " ").map { Int($0)! }
var temp = Array(repeating: 0, count: len)
if max >= k {
    merge_sort(&array, p: 0, r: array.count-1)
    print(num)
} else { print(-1) }

(0..<Int(readLine()!)!).forEach { _ in
    count = 0
    print("\(isPalindrome(Array(readLine()!))) \(count)")
}

/*
 칸토어 집합
 https://www.acmicpc.net/problem/4779
 */
// HOF Version
while true {
    guard let input = readLine() else { break }
    let num = Int(input)!
    if num == 0 { print("-") }
    else {
        print((1...num).reduce("-") { result, num -> String in
            return result + String(repeating: " ", count: Int(pow(3.0, Float(num-1)))) + result
        })
    }
}

// Recursive Function
func hyphen(n: Int) -> String {
    if n == 0 { return "-" }
    return hyphen(n: n - 1) + String(repeating: " ", count: Int(pow(3.0, Float(n-1)))) + hyphen(n: n - 1)
}
while true {
    guard let input = readLine() else { break }
    print(hyphen(n: Int(input)!))
}
