import Foundation

/*
 백준 단계 별로 풀어보기
 5단계 반복문 https://www.acmicpc.net/step/7
 문자열을 다루는 문제들을 해결해 봅시다.
 */

/*
 문자와 문자열
 https://www.acmicpc.net/problem/27866
 */
let string = Array(readLine()!)
print("\(string[Int(readLine()!)! - 1])")

/*
 단어 길이 재기
 https://www.acmicpc.net/problem/2743
 */
print(readLine()!.count)

/*
 문자열
 https://www.acmicpc.net/problem/9086
 */
(0..<Int(readLine()!)!).forEach { _ in
    let line = readLine()!
    print("\(line.first!)\(line.last!)")
}

/*
 아스키 코드
 https://www.acmicpc.net/problem/11654
 */
print(Character(readLine()!).asciiValue!)

/*
 숫자의 합
 https://www.acmicpc.net/problem/11720
 */
readLine()
print(readLine()!.map { Int(String($0))! }.reduce(0, +))

/*
 알파벳 찾기
 https://www.acmicpc.net/problem/10809
 */
let string = readLine()!
let count = (0..<26).map {
    Array(string).firstIndex(of: Character(UnicodeScalar(97 + $0))) ?? -1
}
print(count.map{String($0)}.joined(separator: " "))

/*
 문자열 반복
 https://www.acmicpc.net/problem/2675
 */
(0..<Int(readLine()!)!).forEach { _ in
    let line = readLine()!.split(separator: " ")
    print(Array(String(line[1])).reduce("") { $0 + String(repeating: $1, count: Int(line[0])!) })
}

/*
 단어의 개수
 https://www.acmicpc.net/problem/1152
 */
print(readLine()!.trimmingCharacters(in: .whitespaces).split(separator: " ").count)

/*
 상수
 https://www.acmicpc.net/problem/2908
 */
print(readLine()!.split(separator: " ").map { Int(String($0.reversed()))! }.max()!)

/*
 다이얼
 https://www.acmicpc.net/problem/5622
 */
print(readLine()!.reduce(0) {
    let asciiValue = Character(String($1)).asciiValue!
    if asciiValue < Character("P").asciiValue! {
        return (((Int(asciiValue) + 1) / 3) - 19) + $0
    } else if asciiValue < Character("W").asciiValue! {
        return ((Int(asciiValue) / 4) - 12) + $0
    } else {
        return 10 + $0
    }
})

/*
 그대로 출력하기
 https://www.acmicpc.net/problem/11718
 */
while true {
    guard let line = readLine() else {
        break
    }
    print(line)
}

