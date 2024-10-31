/*
 예산
 https://www.acmicpc.net/problem/2512
*/
import Foundation

let n = Int(readLine()!)!
let cost = readLine()!.split(separator: " ").map { Int("\($0)")! }
let m = Int(readLine()!)!

var right = cost.max()!
if (cost.reduce(0){$0+$1}) <= m {
    print(right)
} else {
    var result = 0
    var left = 0
    while left <= right {
        let mid = (left + right) / 2
        let costSum = cost.reduce(0) { $0 + min($1, mid) }
        if costSum <= m {
            result = mid
            left = mid + 1
            if costSum == m { break }
        } else {
            right = mid - 1
        }
    }
    print(result)
}
