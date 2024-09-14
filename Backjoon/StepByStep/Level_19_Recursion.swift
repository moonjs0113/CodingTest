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
(0..<Int(readLine()!)!).forEach { _ in
    count = 0
    print("\(isPalindrome(Array(readLine()!))) \(count)")
}
