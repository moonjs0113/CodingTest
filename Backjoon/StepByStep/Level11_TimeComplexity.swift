import Foundation

/*
 백준 단계 별로 풀어보기
 11단계 시간 복잡도 https://www.acmicpc.net/step/53
 프로그램의 정확한 실행 시간을 예측하기는 매우 어렵습니다. 하지만 시간 복잡도를 사용하여 대략적인 예측은 가능합니다.
 */

/*
 알고리즘 수업 - 알고리즘의 수행 시간 1
 https://www.acmicpc.net/problem/24262
 */
print("1")
print("0")

/*
 알고리즘 수업 - 알고리즘의 수행 시간 2
 https://www.acmicpc.net/problem/24263
 */
print(Int(readLine()!)!)
print("1")

/*
 알고리즘 수업 - 알고리즘의 수행 시간 3
 https://www.acmicpc.net/problem/24264
 */
let num = Int(readLine()!)!
print(num * num)
print("2")

/*
 알고리즘 수업 - 알고리즘의 수행 시간 4
 https://www.acmicpc.net/problem/24265
 */
//print((1..<Int(readLine()!)!).reduce(0,+))
let num = Int(readLine()!)! - 1
print((num * (num + 1)) / 2)
print("2")

/*
 알고리즘 수업 - 알고리즘의 수행 시간 5
 https://www.acmicpc.net/problem/24265
 */
let num = Int(readLine()!)!
print(num * num * num)
print("3")

/*
 알고리즘 수업 - 알고리즘의 수행 시간 6
 https://www.acmicpc.net/problem/24265
 */(
let num = Int(readLine()!)!
print(num < 3 ? "0" : "\((num * ((num * num) - (3 * num) + 2)) / 6)")
print("3")

/*
 알고리즘 수업 - 점근적 표기 1
 https://www.acmicpc.net/problem/24313
 */
let f = readLine()!.split(separator: " ").map { Int($0)! }
let c = Int(readLine()!)!
let n0 = Int(readLine()!)!
print(((f[1] <= (c - f[0]) * n0) && (f[0] <= c)) ? 1 : 0)
