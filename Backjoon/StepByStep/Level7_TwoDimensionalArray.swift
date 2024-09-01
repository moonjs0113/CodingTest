import Foundation

/*
 백준 단계 별로 풀어보기
 7단계 2차원 배열 https://www.acmicpc.net/step/2
 배열 안에 배열이 있다면 어떨까요? 2차원 배열을 만들어 봅시다.
 */

/*
 행렬 덧셈
 https://www.acmicpc.net/problem/2738
 */
let size = readLine()!.split(separator: " ").map { Int($0)! }.first!
zip(
    (0..<size).map { _ in readLine()!.split(separator: " ").map { Int($0)! } },
    (0..<size).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
).map {
    zip($0.0, $0.1).map { String( $0.0 + $0.1 ) }.joined(separator: " ")
}.forEach {
    print($0)
}

/*
 최댓값
 https://www.acmicpc.net/problem/2566
 */
var max = 0
var position: (Int, Int) = (0, 0)
(0..<9).forEach { i in
    let array = readLine()!.split(separator: " ").map { Int($0)! }
    if array.max()! >= max {
        max = array.max()!
        position = (i+1, array.firstIndex(of: max)! + 1)
    }
}
print(max)
print(position.0, position.1)

/*
 세로읽기
 https://www.acmicpc.net/problem/10798
 */
let array = (0..<5).map { _ in Array(readLine()!) }
let maxLen = array.map { $0.count }.max()!
print((0..<maxLen).map { i in
    array.compactMap { $0.count > i ? "\($0[i])" : nil }.joined(separator: "")
}.joined(separator: ""))

/*
 색종이
 https://www.acmicpc.net/problem/2563
 */
var board = Array(repeating: Array(repeating: 0, count: 100), count: 100)
(0..<Int(readLine()!)!).forEach { _ in
    let position = readLine()!.split(separator: " ").map { Int($0)! }
    (position[0]...position[0]+9).forEach { x in
        (position[1]...position[1]+9).forEach { y in
            board[x][y] = 1
        }
    }
}
print(board.flatMap{ $0 }.reduce(0, +))

