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
