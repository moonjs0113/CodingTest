import Foundation

/*
 백준 단계 별로 풀어보기
 16단계 스택, 큐, 덱 https://www.acmicpc.net/step/11
 스택, 큐, 덱 자료구조를 사용하여 문제를 해결해 봅시다.
 */

/*
 스택 2
 https://www.acmicpc.net/problem/28278
 */
var stack: [Int] = []
(0..<Int(readLine()!)!).forEach { _ in
    let input = readLine()!
    if input.count == 1 {
        switch Int(input)! {
        case 2: print(stack.popLast() ?? -1)
        case 3: print(stack.count)
        case 4: print(stack.isEmpty ? "1" : "0")
        default: print(stack.last ?? -1)
        }
    } else {
        stack.append(Int(input.split(separator: " ").last!)!)
    }
}

/*
 제로
 https://www.acmicpc.net/problem/10773
 */
var stack: [Int] = []
var result = 0
(0..<Int(readLine()!)!).forEach { _ in
    let input = Int(readLine()!)!
    if input == 0 {
        result -= (stack.popLast() ?? 0)
    } else {
        stack.append(input)
        result += input
    }
}
print(result)

/*
 괄호
 https://www.acmicpc.net/problem/9012
 */
(0..<Int(readLine()!)!).forEach { _ in
    let VPS = readLine()!
    if VPS.first! == ")" || VPS.last! == "(" { print("NO"); return }
    var stack: [Int] = []
    for p in VPS {
        if "\(p)" == "(" {
            stack.append(0)
        } else {
            if stack.isEmpty { print("NO"); return }
            stack.popLast()
        }
    }
    print(stack.isEmpty ? "YES" : "NO")
}

/*
 균형잡힌 세상
 https://www.acmicpc.net/problem/4949
 */
Loop: while true {
    let VPS = readLine()!
    if VPS == "." { break }
    var stack: [String] = []
    for p in VPS {
        if "\(p)" == "(" || "\(p)" == "[" {
            stack.append("\(p)")
        } else if "\(p)" == ")" || "\(p)" == "]" {
            if (stack.last ?? "") == ("\(p)" == ")" ? "(" : "[") {
                stack.popLast()
            } else {
                print("no"); continue Loop
            }
        }
    }
    print(stack.isEmpty ? "yes" : "no")
}
