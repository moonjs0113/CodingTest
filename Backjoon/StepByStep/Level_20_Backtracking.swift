import Foundation

/*
 백준 단계 별로 풀어보기
 20단계 백트래킹 https://www.acmicpc.net/step/34
 모든 경우를 탐색하는 백트래킹 알고리즘을 배워 봅시다.
 */

/*
 N과 M (1)
 https://www.acmicpc.net/problem/15649
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let array = Array(1...nums[0])
func backtracking(a: [Int], set: Set<Int>) {
    if a.count == nums[1] {
        print(a.reduce("") { $0 + "\($1) " })
        return
    }
    for i in array {
        var next = a
        if !set.contains(i) {
            next.append(i)
            backtracking(a: next, set: set.union([i]))
        }
    }
}
backtracking(a: [], set: [])

/*
 N과 M (2)
 https://www.acmicpc.net/problem/15650
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let array = Array(1...nums[0])
func backtracking(a: [Int], i: Int = 0) {
    if a.count == nums[1] {
        print(a.reduce("") { $0 + "\($1) " })
        return
    }
    for index in (i..<nums[0]) {
        if index >= nums[0] { break }
        var next = a
        next.append(array[index])
        backtracking(a: next, i: index + 1)
    }
}
backtracking(a: [])

/*
 N과 M (3)
 https://www.acmicpc.net/problem/15651
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
func backtracking(a: [Int]) {
    if a.count == nums[1] { print(a.reduce("") { $0 + "\($1) " })
    } else { (1...nums[0]).forEach { backtracking(a: a + [$0]) } }
}
backtracking(a: [])

/*
 N과 M (4)
 https://www.acmicpc.net/problem/15652
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
func backtracking(a: [Int], i: Int) {
    if a.count == nums[1] { print(a.reduce("") { $0 + "\($1) " })
    } else {
        ((i+1)...nums[0]).forEach {
            backtracking(a: a + [$0], i: $0 - 1)
        }
    }
}
backtracking(a: [], i: 0)

/*
 N-Queen
 https://www.acmicpc.net/problem/9663
 */
let num = Int(readLine()!)!
var coordinate = Array(repeating: 0, count: num)
var count = 0
var subCount = 0
func nQueen(_ x: Int, _ f: Int) {
    if x == num {
        if f == num / 2 { subCount += 1 }
        count += 1
        return
    }
    let range = (x == 0) ? ((num + 1) / 2) : num
Loop: for i in (0..<range) {
    coordinate[x] = i
    for j in (0..<x) {
        if coordinate[x] == coordinate[j] || abs(coordinate[x] - coordinate[j]) == abs(x - j) {
            continue Loop
        }
    }
    nQueen(x+1, (x == 0 && f == -1) ? i : f)
}
}
nQueen(0, -1)
print(count * 2 - subCount)

/*
 스도쿠
 https://www.acmicpc.net/problem/2580
 */
var sudoku: [[Int]] = []
var zero: [(i: Int, j: Int)] = []
(0...8).forEach { j in
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    sudoku.append(row)
    (0...8).forEach { i in
        if row[i] == 0 { zero.append((i, j)) }
    }
}
func checkCol(i: Int, num: Int) -> Bool {
    for j in 0..<9 {
        if sudoku[j][i] == num { return true }
    }
    return false
}
func checkBlock(_ i: Int, _ j: Int, n: Int) -> Bool {
    let iStep = (i / 3) * 3
    let jStep = (j / 3) * 3
    for r in 0..<3 {
        for c in 0..<3 {
            if sudoku[jStep + r][iStep + c] == n  { return true }
        }
    }
    return false
}

func placeNumber(_ z: Int) {
    if z == zero.count {
        sudoku.forEach { print($0.reduce("") { $0 + "\($1) " }) }
        exit(0)
    }
    let i = zero[z].0
    let j = zero[z].1
    
    for n in (1...9) {
        if sudoku[j].contains(n) || checkCol(i: i, num: n) || checkBlock(i, j, n: n) {
            continue
        }
        sudoku[j][i] = n
        placeNumber(z + 1)
        sudoku[j][i] = 0
    }
}
placeNumber(0)

/*
 연산자 끼워넣기
 https://www.acmicpc.net/problem/14888
 */
let nCount = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var operators = readLine()!.split(separator: " ").map { Int($0)! }

var resultMax = Int.min
var resultMin = Int.max

func backtracking(result: Int, index: Int) {
    if index == nCount {
        resultMax = max(result, resultMax)
        resultMin = min(result, resultMin)
        return
    }
    
    for i in 0..<operators.count {
        if operators[i] == 0 { continue }
        var result = result
        
        switch i {
        case 0:
            result += nums[index]
        case 1:
            result -= nums[index]
        case 2:
            result *= nums[index]
        default:
            result /= nums[index]
        }
        
        operators[i] -= 1
        backtracking(result: result, index: index + 1)
        operators[i] += 1
    }
}
backtracking(result: nums.first!, index: 1)
print("\(resultMax)\n\(resultMin)")
