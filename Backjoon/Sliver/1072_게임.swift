/*
 게임
 https://www.acmicpc.net/problem/1072
*/

let xy = readLine()!.split(separator: " ").map{ Int("\($0)")! }
if xy[0] == xy[1] || ((xy[1] * 100) / xy[0]) == 99 {
    print(-1)
} else {
    let z = (xy[1] * 100) / xy[0]
    let numerator = (((z + 1) * xy[0]) - (100 * xy[1]))
    let denominator = 99 - z
    let result = numerator / denominator
    print(numerator % denominator == 0 ? result : result + 1)
}
