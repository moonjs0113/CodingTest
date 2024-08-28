import Foundation

/*
 백준 단계 별로 풀어보기
 1단계 입출력과 사칙연산 https://www.acmicpc.net/step/1
 입력, 출력과 사칙연산을 연습해 봅시다. Hello World!
 */

/*
 1. Hello World
 https://www.acmicpc.net/problem/2557
 */
print("Hello World!")

/*
 2. A+B
 https://www.acmicpc.net/problem/1000
 */
print(readLine()!.split(separator: " ").compactMap{Int($0)}.reduce(0,+))

/*
 3. A-B
 https://www.acmicpc.net/problem/1001
 */
let AB = readLine()!.split(separator: " ").compactMap{Int($0)}
print(AB[0] - AB[1])

/*
 4. A×B
 https://www.acmicpc.net/problem/10998
 */
let AB = readLine()!.split(separator: " ").compactMap{Int($0)}
print(AB[0] * AB[1])

/*
 5. A/B
 https://www.acmicpc.net/problem/1008
 */
let AB = readLine()!.split(separator: " ").compactMap{Double($0)}
print(AB[0] / AB[1])

/*
 6. 사칙연산
 https://www.acmicpc.net/problem/10869
 */
let AB = readLine()!.split(separator: " ").compactMap{Int($0)}
print(AB[0] + AB[1])
print(AB[0] - AB[1])
print(AB[0] * AB[1])
print(AB[0] / AB[1])
print(AB[0] % AB[1])

/*
 7. ??!
 https://www.acmicpc.net/problem/10926
 */
print("\(readLine()!)??!")

/*
 8. 1998년생인 내가 태국에서는 2541년생?!
 https://www.acmicpc.net/problem/18108
 */
print("\(Int(readLine()!)! - 543)")

/*
 9. 나머지
 https://www.acmicpc.net/problem/10430
 */
let ABC = readLine()!.split(separator: " ").compactMap{Int($0)}
print((ABC[0] + ABC[1]) % ABC[2])
print(((ABC[0] % ABC[2]) + (ABC[1] % ABC[2])) % ABC[2])
print((ABC[0] * ABC[1]) % ABC[2])
print(((ABC[0] % ABC[2]) * (ABC[1] % ABC[2])) % ABC[2])

/*
 10. 곱셈
 https://www.acmicpc.net/problem/2588
 */
let A = readLine()!
let B = readLine()!
Array(B).reversed().forEach {
    print(Int("\($0)")! * Int(A)!)
}
print(Int(A)! * Int(B)!)

/*
 11. 꼬마 정민
 https://www.acmicpc.net/problem/11382
 */
print(readLine()!.split(separator: " ").reduce(0) { $0 + Int($1)! })

/*
 12. 고양이
 https://www.acmicpc.net/problem/10171
 */
print(
"""
\\    /\\
 )  ( ')
(  /  )
 \\(__)|
"""
)

/*
 13. 개
 https://www.acmicpc.net/problem/10172
 */
print(
"""
|\\_/|
|q p|   /}
( 0 )\"\"\"\\
|\"^\"`    |
||_/=\\\\__|
"""
)
