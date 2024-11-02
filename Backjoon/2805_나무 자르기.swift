/*
 나무 자르기
 https://www.acmicpc.net/problem/2805
*/

let nm = readLine()!.split(separator: " ").map { Int("\($0)")! }
let tree = readLine()!.split(separator: " ").map { Int("\($0)")! }
var left = 0
var right = tree.max()!
var result = 0
while left <= right {
    let mid = (left + right) / 2
    let sums = tree.reduce(0) { $0 + ($1 > mid ? $1 - mid : 0) }
    if sums >= nm[1] {
        result = mid
        left = mid + 1
        if sums == nm[1] { break }
    } else {
        right = mid - 1
    }
}
print(result)
