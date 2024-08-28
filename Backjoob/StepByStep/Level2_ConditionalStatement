import Foundation

/*
 백준 단계 별로 풀어보기
 2단계 조건문 https://www.acmicpc.net/step/4
 if 등의 조건문을 사용해 봅시다.
 */
var result = ""

/*
 두 수 비교하기
 https://www.acmicpc.net/problem/1330
 */
let AB = readLine()!.split(separator: " ").compactMap{Int($0)!}
if AB[0] < AB[1] {
    print("<")
} else {
    if AB[0] == AB[1] {
        print("==")
    } else {
        print(">")
    }
}

/*
 시험 성적
 https://www.acmicpc.net/problem/9498
 */
switch Int(readLine()!)! {
case 90...100: print("A")
case 80...89: print("B")
case 70...79: print("C")
case 60...69: print("D")
default: print("F")
}

/*
 윤년
 https://www.acmicpc.net/problem/2753
 */
let Y = Int(readLine()!)!
print("\(Y % 4 == 0 && (Y % 100 != 0 || Y % 400 == 0) ? 1 : 0)")

/*
 사분면 고르기
 https://www.acmicpc.net/problem/14681
 */
let X = Int(readLine()!)!
let Y = Int(readLine()!)!
print("\(2 + (Y > 0 ? -1 : 1) + (X * Y < 0 ? 1 : 0))")

/*
 알람 시계
 https://www.acmicpc.net/problem/2884
 */
let HM = readLine()!.split(separator: " ").compactMap{Int($0)!}
if HM[1] >= 45 {
    print("\(HM[0]) \(HM[1] - 45)")
} else {
    print("\(HM[0] > 0 ? HM[0] - 1 : 23) \(HM[1] - 45 + 60)")
}

/*
 오븐 시계
 https://www.acmicpc.net/problem/2525
 */
let HM = readLine()!.split(separator: " ").compactMap{Int($0)!}
let T = HM[1] + Int(readLine()!)!
let newH = HM[0] + (T / 60)
print("\(newH > 23 ? (newH - 24) : newH) \((T % 60))")

/*
 주사위 세개
 https://www.acmicpc.net/problem/2480
 */
let dice = readLine()!.split(separator: " ").compactMap{Int($0)!}
if Set(dice).count == 3 {
    print("\(dice.max()! * 100)")
} else if Set(dice).count == 1 {
    print("\(10000 + (dice.max()! * 1000))")
} else {
    print("\(1000 + ((dice[0] == dice[1] ? dice[0] : dice[2]) * 100))")
}

