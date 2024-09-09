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

/*
 도키도키 간식드리미
 https://www.acmicpc.net/problem/12789
 */
readLine()
var i = 1
var stack: [Int] = []
for num in readLine()!.split(separator: " ") {
    let n = Int(num)!
    if n == i {
        i += 1
        while (stack.last ?? 0) == i {
            i += 1
            stack.popLast()
        }
        continue
    }
    if (stack.last ?? 1001) < n {
        i = -1
        print("Sad")
        break
    }
    stack.append(n)
}
if i != -1 { print("Nice") }

/*
 큐 2
 https://www.acmicpc.net/problem/18258
 */

// General Code
var queue: [Int?] = Array(repeating: nil, count: 2_000_000)
var headPointer = 0
var inputPointer = 0
(0..<Int(readLine()!)!).forEach { _ in
    let command = readLine()!
    if command.contains(" ") {
        queue[inputPointer] = Int(command.split(separator: " ").last!)!
        inputPointer += 1
    } else {
        let isEmpty = (headPointer == inputPointer)
        switch command {
        case "pop":
            if !isEmpty {
                print(queue[headPointer]!)
                queue[headPointer] = nil
                headPointer += 1
            } else {
                print(-1)
            }
        case "size": print(inputPointer - headPointer)
        case "empty": print(isEmpty ? 1 : 0)
        case "front": print(isEmpty ? -1 : queue[headPointer]!)
        default: print(inputPointer == 0 ? -1 : (queue[inputPointer-1] ?? -1)) // back
        }
    }
}

// Using File IO -> 백준 입출력 시간 제한
var queue: [Int] = []
var pointer = 0
var result = ""
let fileIO = FileIO()
(0..<fileIO.readInt()).forEach { _ in
    let command = fileIO.readStringToIntValue()
    let isEmpty = !(pointer < queue.count)
    switch command {
    case 448: // push
        queue.append(fileIO.readInt())
    case 335: // pop
        if !isEmpty {
            result += "\(queue[pointer])\n"
            pointer += 1
        } else {
            result += "-1\n"
        }
    case 443: result += "\(queue.count - pointer)\n" // size
    case 559: result += "\(isEmpty ? 1 : 0)\n" // empty
    case 553: result += "\(isEmpty ? -1 : queue[pointer])\n" // front
    case 401: result += "\(isEmpty ? -1 : queue.last!)\n" // back
    default: return
    }
}
print(result)

/*
 카드2
 https://www.acmicpc.net/problem/2164
 */
let num = Int(readLine()!)!
if num < 3 { print(num) }
else {
    var i = 4
    while num > i {
        i *= 2
    }
    print((num - i / 2) * 2)
}

/*
 요세푸스 문제 0
 https://www.acmicpc.net/problem/11866
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var array = Array(1...nums[0])
var result: [Int] = []
var index = 0
while array.count > 1 {
    index += (nums[1] - 1)
    while index >= array.count {
        index -= array.count
    }
    result.append(array.remove(at: index))
}
result.append(array.popLast()!)
var s = "\(result)"
s.removeLast()
s.removeFirst()
print("<\(s)>")

/*
 덱 2
 https://www.acmicpc.net/problem/28279
 Deque : https://github.com/moonjs0113/CodingTest/blob/main/Backjoon/StepByStep/Deque.swift
 */
let deque = Deque()
(0..<Int(readLine()!)!).forEach { _ in
    let command = readLine()!
    if command.count == 1 {
        let c = Int(command)!
        switch c {
        case 3...4: print(deque.pop(isFront: (c % 2 == 1)) ?? -1)
        case 5: print(deque.count)
        case 6: print((deque.count == 0) ? "1" : "0")
        case 7...8: print(deque.getValue(isFront: (c % 2 == 1)) ?? -1)
        default: break
        }
    } else {
        let input = command.split(separator: " ").map { Int($0)! }
        deque.push(isFront: input[0] == 1, value: input[1])
    }
}

/*
 풍선 터뜨리기
 https://www.acmicpc.net/problem/2346
 DoubleLinkedList : https://github.com/moonjs0113/CodingTest/blob/main/Backjoon/StepByStep/DoubleLinkedList.swift
 */
readLine()
let linkedList = DoubleLinkedList()
readLine()!.split(separator: " ").forEach {
    linkedList.push(isFront: false, value: Int($0)!)
}
var node = linkedList.front?.back
var result = ""
while linkedList.count > 0 {
    let step = node?.val ?? 0
    let isBack = (step > 0)
    result += "\(node?.index ?? 0) "
    var tempNode = node
    (0..<abs(step)).forEach { i in
        tempNode = isBack ? tempNode?.back : tempNode?.front
        if tempNode?.back == nil || tempNode?.front == nil {
            tempNode = isBack ? linkedList.front?.back : linkedList.back?.front
        }
        if i == 0 { linkedList.popNode(node) }
    }
    node = tempNode
}
result.popLast()
print(result)
