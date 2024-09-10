import Foundation

/*
 백준 단계 별로 풀어보기
 17단계 조합론 https://www.acmicpc.net/step/61
 경우의 수를 세어 봅시다.
 */

/*
 베라의 패션
 https://www.acmicpc.net/problem/15439
 */
let num = Int(readLine()!)!
print(num * (num - 1))

/*
 녹색거탑
 https://www.acmicpc.net/problem/24723
 */
let num = Int(readLine()!)!
print(Int(pow(Float(2), Float(num))))

/*
 팩토리얼
 https://www.acmicpc.net/problem/10872
 */
let num = Int(readLine()!)!
print(num == 0 ? 1 : (1...num).reduce(1, *))
